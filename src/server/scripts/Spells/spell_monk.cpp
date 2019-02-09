/*
 * Copyright (C) 2008-2019 TrinityCore <https://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

/*
 * Scripts for spells with SPELLFAMILY_MONK and SPELLFAMILY_GENERIC spells used by monk players.
 * Scriptnames of files in this file should be prefixed with "spell_monk_".
 */

#include "AreaTrigger.h"
#include "AreaTriggerAI.h"
#include "GridNotifiers.h"
#include "ScriptMgr.h"
#include "SpellAuraEffects.h"
#include "SpellHistory.h"
#include "SpellMgr.h"
#include "SpellPackets.h"
#include "SpellScript.h"

enum MonkSpells
{
    SPELL_MONK_CRACKLING_JADE_LIGHTNING_CHANNEL         = 117952,
    SPELL_MONK_CRACKLING_JADE_LIGHTNING_CHI_PROC        = 123333,
    SPELL_MONK_CRACKLING_JADE_LIGHTNING_KNOCKBACK       = 117962,
    SPELL_MONK_CRACKLING_JADE_LIGHTNING_KNOCKBACK_CD    = 117953,
    SPELL_MONK_PROVOKE_SINGLE_TARGET                    = 116189,
    SPELL_MONK_PROVOKE_AOE                              = 118635,
    SPELL_MONK_SOOTHING_MIST                            = 115175,
    SPELL_MONK_STANCE_OF_THE_SPIRITED_CRANE             = 154436,
    SPELL_MONK_SURGING_MIST_HEAL                        = 116995,
    SPELL_MONK_ROLL                                     = 109132,
    SPELL_MONK_ROLL_BACKWARD                            = 109131,
    SPELL_MONK_ROLL_TRIGGER                             = 107427,
    SPELL_MONK_ITEM_PVP_GLOVES_BONUS                    = 124489,
    SPELL_MONK_TOUCH_OF_DEATH_DAMAGE                    = 229980,
    SPELL_MONK_ENHANCED_ROLL                            = 157361,
    SPELL_MONK_XUEN_AURA                                = 123999,
    SPELL_MONK_FISTS_OF_FURY                            = 113656,
    SPELL_MONK_RISING_SUN_KICK                          = 107428,
    SPELL_MONK_WHIRLING_DRAGON_PUNCH_CASTER_AURA        = 196742,
    SPELL_MONK_WHIRLING_DRAGON_PUNCH_DAMAGE             = 158221,
    SPELL_MONK_VIVIFY                                   = 116670,
    SPELL_MONK_LIFECYCLES_ENVELOPING_MIST               = 197919,
    SPELL_MONK_LIFECYCLES_VIVIFY                        = 197916,
    SPELL_MONK_ENVELOPING_MIST_HEAL                     = 132120,
    SPELL_MONK_RENEWING_MIST_PERIODIC                   = 127735,
    SPELL_MONK_CRANE_HEAL                               = 213370
};

// 117952 - Crackling Jade Lightning
class spell_monk_crackling_jade_lightning : public AuraScript
{
    PrepareAuraScript(spell_monk_crackling_jade_lightning);

    bool Validate(SpellInfo const* /*spellInfo*/) override
    {
        return ValidateSpellInfo(
        {
            SPELL_MONK_STANCE_OF_THE_SPIRITED_CRANE,
            SPELL_MONK_CRACKLING_JADE_LIGHTNING_CHI_PROC
        });
    }

    void OnTick(AuraEffect const* /*aurEff*/)
    {
        if (Unit* caster = GetCaster())
            if (caster->HasAura(SPELL_MONK_STANCE_OF_THE_SPIRITED_CRANE))
                caster->CastSpell(caster, SPELL_MONK_CRACKLING_JADE_LIGHTNING_CHI_PROC, TRIGGERED_FULL_MASK);
    }

    void Register() override
    {
        OnEffectPeriodic += AuraEffectPeriodicFn(spell_monk_crackling_jade_lightning::OnTick, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE);
    }
};

// 117959 - Crackling Jade Lightning
class spell_monk_crackling_jade_lightning_knockback_proc_aura : public AuraScript
{
    PrepareAuraScript(spell_monk_crackling_jade_lightning_knockback_proc_aura);

    bool Validate(SpellInfo const* /*spellInfo*/) override
    {
        return ValidateSpellInfo(
        {
            SPELL_MONK_CRACKLING_JADE_LIGHTNING_KNOCKBACK,
            SPELL_MONK_CRACKLING_JADE_LIGHTNING_KNOCKBACK_CD
        });
    }

    bool CheckProc(ProcEventInfo& eventInfo)
    {
        if (GetTarget()->HasAura(SPELL_MONK_CRACKLING_JADE_LIGHTNING_KNOCKBACK_CD))
            return false;

        if (eventInfo.GetActor()->HasAura(SPELL_MONK_CRACKLING_JADE_LIGHTNING_CHANNEL, GetTarget()->GetGUID()))
            return false;

        Spell* currentChanneledSpell = GetTarget()->GetCurrentSpell(CURRENT_CHANNELED_SPELL);
        if (!currentChanneledSpell || currentChanneledSpell->GetSpellInfo()->Id != SPELL_MONK_CRACKLING_JADE_LIGHTNING_CHANNEL)
            return false;

        return true;
    }

    void HandleProc(AuraEffect const* /*aurEff*/, ProcEventInfo& eventInfo)
    {
        GetTarget()->CastSpell(eventInfo.GetActor(), SPELL_MONK_CRACKLING_JADE_LIGHTNING_KNOCKBACK, TRIGGERED_FULL_MASK);
        GetTarget()->CastSpell(GetTarget(), SPELL_MONK_CRACKLING_JADE_LIGHTNING_KNOCKBACK_CD, TRIGGERED_FULL_MASK);
    }

    void Register() override
    {
        DoCheckProc += AuraCheckProcFn(spell_monk_crackling_jade_lightning_knockback_proc_aura::CheckProc);
        OnEffectProc += AuraEffectProcFn(spell_monk_crackling_jade_lightning_knockback_proc_aura::HandleProc, EFFECT_0, SPELL_AURA_DUMMY);
    }
};

// 115546 - Provoke
class spell_monk_provoke : public SpellScript
{
    PrepareSpellScript(spell_monk_provoke);

    static uint32 const BlackOxStatusEntry = 61146;

    bool Validate(SpellInfo const* spellInfo) override
    {
        if (!(spellInfo->GetExplicitTargetMask() & TARGET_FLAG_UNIT_MASK)) // ensure GetExplTargetUnit() will return something meaningful during CheckCast
            return false;
        return ValidateSpellInfo(
        {
            SPELL_MONK_PROVOKE_SINGLE_TARGET,
            SPELL_MONK_PROVOKE_AOE
        });
    }

    SpellCastResult CheckExplicitTarget()
    {
        if (GetExplTargetUnit()->GetEntry() != BlackOxStatusEntry)
        {
            SpellInfo const* singleTarget = sSpellMgr->AssertSpellInfo(SPELL_MONK_PROVOKE_SINGLE_TARGET);
            SpellCastResult singleTargetExplicitResult = singleTarget->CheckExplicitTarget(GetCaster(), GetExplTargetUnit());
            if (singleTargetExplicitResult != SPELL_CAST_OK)
                return singleTargetExplicitResult;
        }
        else if (GetExplTargetUnit()->GetOwnerGUID() != GetCaster()->GetGUID())
            return SPELL_FAILED_BAD_TARGETS;

        return SPELL_CAST_OK;
    }

    void HandleDummy(SpellEffIndex effIndex)
    {
        PreventHitDefaultEffect(effIndex);
        if (GetHitUnit()->GetEntry() != BlackOxStatusEntry)
            GetCaster()->CastSpell(GetHitUnit(), SPELL_MONK_PROVOKE_SINGLE_TARGET, true);
        else
            GetCaster()->CastSpell(GetHitUnit(), SPELL_MONK_PROVOKE_AOE, true);
    }

    void Register() override
    {
        OnCheckCast += SpellCheckCastFn(spell_monk_provoke::CheckExplicitTarget);
        OnEffectHitTarget += SpellEffectFn(spell_monk_provoke::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
    }
};

// 109132 - Roll 8.0.1 28153
class spell_monk_roll : public SpellScriptLoader
{
public:
    spell_monk_roll() : SpellScriptLoader("spell_monk_roll") { }

    class spell_monk_roll_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_roll_SpellScript);

    private:
        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_MONK_ROLL) ||
                !sSpellMgr->GetSpellInfo(SPELL_MONK_ROLL_TRIGGER) ||
                !sSpellMgr->GetSpellInfo(SPELL_MONK_ROLL_BACKWARD))
                return false;
            return true;
        }

        void HandleAfterCast()
        {
            Unit* caster = GetCaster();
            if (!caster || caster->GetTypeId() != TYPEID_PLAYER)
                return;

            if (caster->HasAura(SPELL_MONK_ITEM_PVP_GLOVES_BONUS))
                caster->RemoveAurasByType(SPELL_AURA_MOD_DECREASE_SPEED);
        }

        void HandleDummy()
        {
            if (Unit* caster = GetCaster())
            {
                if (caster->HasUnitMovementFlag(MOVEMENTFLAG_BACKWARD))
                    caster->CastSpell(caster, SPELL_MONK_ROLL_BACKWARD, true);
                else
                    caster->CastSpell(caster, SPELL_MONK_ROLL_TRIGGER, true);
            }
        }

        void Register() override
        {
            AfterCast += SpellCastFn(spell_monk_roll_SpellScript::HandleAfterCast);
            AfterHit += SpellHitFn(spell_monk_roll_SpellScript::HandleDummy);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_roll_SpellScript();
    }
};

// 115080 - Touch of Death 8.0.1 28153 
class spell_monk_touch_of_death : public AuraScript
{
    PrepareAuraScript(spell_monk_touch_of_death);

    void OnTick(AuraEffect const* /*aurEff*/)
    {
        if (Unit* caster = GetCaster())
        {
            uint32 damagePct = GetSpellInfo()->GetEffect(EFFECT_1)->BasePoints;

            // Damage reduced to Players, need to check reduction value
            if (GetTarget()->IsPlayer())
                damagePct /= 2;

            caster->CastCustomSpell(SPELL_MONK_TOUCH_OF_DEATH_DAMAGE, SPELLVALUE_BASE_POINT0, CalculatePct(caster->GetMaxHealth(), damagePct), GetTarget());
        }
    }

    void Register() override
    {
        OnEffectPeriodic += AuraEffectPeriodicFn(spell_monk_touch_of_death::OnTick, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
    }
};

// 107427 - Roll trigger 8.0.1 28153
class spell_monk_roll_trigger : public SpellScriptLoader
{
public:
    spell_monk_roll_trigger() : SpellScriptLoader("spell_monk_roll_trigger") {}

    class spell_monk_roll_trigger_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_roll_trigger_AuraScript);

        void CalcSpeed(AuraEffect const* /*aurEff*/, int32& amount, bool& /*canBeRecalculated*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            if (caster->HasAura(SPELL_MONK_ENHANCED_ROLL))
                amount = 277;
        }

        void CalcSpeed2(AuraEffect const* /*aurEff*/, int32& amount, bool& /*canBeRecalculated*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            if (!caster->HasAura(SPELL_MONK_ENHANCED_ROLL))
                return;

            amount = 377;
        }

        void SendAmount(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            if (!caster->HasAura(SPELL_MONK_ENHANCED_ROLL))
                return;

            Aura* aur = GetAura();
            if (!aur)
                return;

            aur->SetMaxDuration(600);
            aur->SetDuration(600);

            if (AuraApplication* aurApp = GetAura()->GetApplicationOfTarget(caster->GetGUID()))
                aurApp->ClientUpdate();
        }

        void Register() override
        {
            DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_monk_roll_trigger_AuraScript::CalcSpeed, EFFECT_0, SPELL_AURA_MOD_SPEED_NO_CONTROL);
            DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_monk_roll_trigger_AuraScript::CalcSpeed2, EFFECT_2, SPELL_AURA_MOD_MINIMUM_SPEED);
            AfterEffectApply += AuraEffectApplyFn(spell_monk_roll_trigger_AuraScript::SendAmount, EFFECT_4, SPELL_AURA_USE_NORMAL_MOVEMENT_SPEED, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_roll_trigger_AuraScript();
    }
};

// 63508 - Xuen 8.0.1 28153
struct npc_monk_xuen : public ScriptedAI
{
    npc_monk_xuen(Creature* creature) : ScriptedAI(creature) {}

    void IsSummonedBy(Unit* /*summoner*/)
    {
        me->CastSpell(me, SPELL_MONK_XUEN_AURA, true);
    }
};

// 152175 Whirling Dragon Punch 8.0.1 28153
class playerScript_monk_whirling_dragon_punch : public PlayerScript
{
public:
    playerScript_monk_whirling_dragon_punch() : PlayerScript("playerScript_monk_whirling_dragon_punch") {}

    void OnCooldownStart(Player* player, SpellInfo const* spellInfo, uint32 /*itemId*/, int32& cooldown, uint32& /*categoryId*/, int32& /*categoryCooldown*/) override
    {
        if (spellInfo->Id == SPELL_MONK_FISTS_OF_FURY)
        {
            SpellInfo const* risingSunKickInfo  = sSpellMgr->GetSpellInfo(SPELL_MONK_RISING_SUN_KICK);
            ApplyCasterAura(player, cooldown, player->GetSpellHistory()->GetChargeRecoveryTime(risingSunKickInfo->ChargeCategoryId));
        }
    }

    void OnChargeRecoveryTimeStart(Player* player, uint32 chargeCategoryId, int32& chargeRecoveryTime) override
    {
        SpellInfo const* risingSunKickInfo = sSpellMgr->GetSpellInfo(SPELL_MONK_RISING_SUN_KICK);
        if (risingSunKickInfo->ChargeCategoryId == chargeCategoryId)
        {
            SpellInfo const* fistsOfFuryInfo = sSpellMgr->GetSpellInfo(SPELL_MONK_RISING_SUN_KICK);
            ApplyCasterAura(player, chargeRecoveryTime, player->GetSpellHistory()->GetRemainingCooldown(fistsOfFuryInfo));
        }
    }

private:
    void ApplyCasterAura(Player* player, int32 cooldown1, int32 cooldown2)
    {
        if (cooldown1 > 0 && cooldown2 > 0)
        {
            uint32 whirlingDragonPunchAuraDuration = std::min(cooldown1, cooldown2);
            player->CastSpell(player, SPELL_MONK_WHIRLING_DRAGON_PUNCH_CASTER_AURA, true);

            if (Aura* aura = player->GetAura(SPELL_MONK_WHIRLING_DRAGON_PUNCH_CASTER_AURA))
                aura->SetDuration(whirlingDragonPunchAuraDuration);
        }
    }
};

// 152175 Whirling Dragon Punch 8.0.1 28153
class spell_monk_whirling_dragon_punch : public AuraScript
{
    PrepareAuraScript(spell_monk_whirling_dragon_punch);

    void OnTick(AuraEffect const* /*aurEff*/)
    {
        if (GetCaster())
            GetCaster()->CastSpell(GetCaster(), SPELL_MONK_WHIRLING_DRAGON_PUNCH_DAMAGE, true);
    }

    void Register() override
    {
        OnEffectPeriodic += AuraEffectPeriodicFn(spell_monk_whirling_dragon_punch::OnTick, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
    }
};

// 197915 - Lifecycles 8.0.1 28153
class spell_monk_lifecycles : public SpellScriptLoader
{
public:
    spell_monk_lifecycles() : SpellScriptLoader("spell_monk_lifecycles") { }

    class spell_monk_lifecycles_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_lifecycles_AuraScript);

        void HandleProc(AuraEffect const* /*aurEff*/, ProcEventInfo& procInfo)
        {
            Unit* caster = GetCaster();

            if (!caster || !procInfo.GetSpellInfo())
                return;

            if (procInfo.GetSpellInfo()->Id == SPELL_MONK_VIVIFY)
                caster->CastSpell(caster, SPELL_MONK_LIFECYCLES_ENVELOPING_MIST, true);

            if (procInfo.GetSpellInfo()->Id == SPELL_MONK_ENVELOPING_MIST_HEAL)
                caster->CastSpell(caster, SPELL_MONK_LIFECYCLES_VIVIFY, true);
        }

        void Register() override
        {
            OnEffectProc += AuraEffectProcFn(spell_monk_lifecycles_AuraScript::HandleProc, EFFECT_0, SPELL_AURA_DUMMY);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_lifecycles_AuraScript();
    }
};

// 115151 - Renewing Mist 8.0.1 28153
class spell_monk_renewing_mist : public SpellScriptLoader
{
public:
    spell_monk_renewing_mist() : SpellScriptLoader("spell_monk_renewing_mist") { }

    class spell_monk_renewing_mist_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_monk_renewing_mist_SpellScript);

        void HandleHit(SpellEffIndex /*eff*/)
        {
            if (Unit* caster = GetCaster())
                if (Unit* target = GetHitUnit())
                {
                    caster->CastSpell(target, SPELL_MONK_RENEWING_MIST_PERIODIC);
                }
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_monk_renewing_mist_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_monk_renewing_mist_SpellScript();
    }
};

// 119611 - Renewing Mist 8.0.1 28153
class spell_monk_renewing_mist_periodic : public SpellScriptLoader
{
public:
    spell_monk_renewing_mist_periodic() : SpellScriptLoader("spell_monk_renewing_mist_periodic") { }

    class spell_monk_renewing_mist_periodic_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_monk_renewing_mist_periodic_AuraScript);

        void OnTick(AuraEffect const* /*aurEff*/)
        {
            if(Unit* caster = GetCaster())
                if(Unit* target = GetTarget())
                    if (target->GetHealthPct() >= 100 && target->HasAura(SPELL_MONK_RENEWING_MIST_PERIODIC))
                    {
                        int32 remainingDuration = target->GetAura(SPELL_MONK_RENEWING_MIST_PERIODIC)->GetDuration();
                        std::list<Unit*> targets;
                        Trinity::AnyFriendlyUnitInObjectRangeCheck check(target, target, 25.0f);
                        Trinity::UnitListSearcher<Trinity::AnyFriendlyUnitInObjectRangeCheck> searcher(target, targets, check);
                        Cell::VisitAllObjects(target, searcher, 25.0f);

                        targets.sort(Trinity::HealthPctOrderPred());
                        if(targets.size() > 1)
                            targets.resize(1);

                        caster->CastSpell(targets.front(), SPELL_MONK_RENEWING_MIST_PERIODIC, true);

                        if(targets.front()->HasAura(SPELL_MONK_RENEWING_MIST_PERIODIC))
                        {
                            targets.front()->GetAura(SPELL_MONK_RENEWING_MIST_PERIODIC)->SetDuration(remainingDuration);
                            target->RemoveAura(SPELL_MONK_RENEWING_MIST_PERIODIC);
                        }
                    }
        }

        void Register() override
        {
            OnEffectPeriodic += AuraEffectPeriodicFn(spell_monk_renewing_mist_periodic_AuraScript::OnTick, EFFECT_0, SPELL_AURA_PERIODIC_HEAL);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_monk_renewing_mist_periodic_AuraScript();
    }
};

// 100868 - Chi Ji 8.0.1 28153
struct npc_monk_chi_ji : public ScriptedAI
{
    npc_monk_chi_ji(Creature* creature) : ScriptedAI(creature) {}

    void IsSummonedBy(Unit* /*summoner*/)
    {
        me->CastSpell(me, SPELL_MONK_CRANE_HEAL, true);
    }
};

void AddSC_monk_spell_scripts()
{
    RegisterAuraScript(spell_monk_crackling_jade_lightning);
    RegisterAuraScript(spell_monk_crackling_jade_lightning_knockback_proc_aura);
    RegisterSpellScript(spell_monk_provoke);
    new spell_monk_roll();
    RegisterAuraScript(spell_monk_touch_of_death);
    new spell_monk_roll_trigger();
    RegisterCreatureAI(npc_monk_xuen);
    new playerScript_monk_whirling_dragon_punch();
    RegisterAuraScript(spell_monk_whirling_dragon_punch);
    new spell_monk_lifecycles();
    new spell_monk_renewing_mist();
    new spell_monk_renewing_mist_periodic();
    RegisterCreatureAI(npc_monk_chi_ji);
}
