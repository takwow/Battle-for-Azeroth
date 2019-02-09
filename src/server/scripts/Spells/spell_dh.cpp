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
 * Scripts for spells with SPELLFAMILY_DEMONHUNTER and SPELLFAMILY_GENERIC spells used by demon hunter players.
 * Ordered alphabetically using scriptname.
 * Scriptnames of files in this file should be prefixed with "spell_dh_".
 */

#include "ScriptMgr.h"
#include "SpellAuraEffects.h"
#include "SpellMgr.h"
#include "SpellScript.h"

enum DemonHunterSpells
{
    SPELL_CHAOS_STRIKE_ENERGIZE             = 193840,
    SPELL_DH_GLIDE                          = 131347
};

// 197125 - Chaos Strike
class spell_dh_chaos_strike : public SpellScriptLoader
{
    public:
        spell_dh_chaos_strike() : SpellScriptLoader("spell_dh_chaos_strike") { }

        class spell_dh_chaos_strike_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_dh_chaos_strike_AuraScript);

            bool Validate(SpellInfo const* /*spellInfo*/) override
            {
                return ValidateSpellInfo({ SPELL_CHAOS_STRIKE_ENERGIZE });
            }

            void HandleEffectProc(AuraEffect const* aurEff, ProcEventInfo& /*eventInfo*/)
            {
                PreventDefaultAction();
                GetTarget()->CastCustomSpell(SPELL_CHAOS_STRIKE_ENERGIZE, SPELLVALUE_BASE_POINT0, aurEff->GetAmount(), GetTarget(), true, nullptr, aurEff);
            }

            void Register() override
            {
                OnEffectProc += AuraEffectProcFn(spell_dh_chaos_strike_AuraScript::HandleEffectProc, EFFECT_0, SPELL_AURA_PROC_TRIGGER_SPELL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_dh_chaos_strike_AuraScript();
        }
};

// 131347 - Glide 8.0.1 28153
class spell_dh_glide : public SpellScriptLoader
{
public:
    spell_dh_glide() : SpellScriptLoader("spell_dh_glide") { }

    class spell_dh_glide_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_dh_glide_SpellScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_DH_GLIDE))
                return false;
            return true;
        }

        SpellCastResult CheckCast()
        {
            if (!GetCaster()->IsFalling())
                return SPELL_FAILED_NOT_ON_GROUND;

            return SPELL_CAST_OK;
        }

        void Register() override
        {
            OnCheckCast += SpellCheckCastFn(spell_dh_glide_SpellScript::CheckCast);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_dh_glide_SpellScript();
    }
};

void AddSC_demon_hunter_spell_scripts()
{
    new spell_dh_chaos_strike();
    new spell_dh_glide();
}
