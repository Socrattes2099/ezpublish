{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<label>{$attribute.content.name|wash(xhtml)}</label><div class="labelbreak"></div>
{section var=MultiOption loop=$attribute.content.multioption_list sequence=array(bglight,bgdark)}<br/>
    {$MultiOption.item.name}<br/>
    <select name=$MultiOption.item.name>
        {section var=Option loop=$MultiOption.item.optionlist}
            {section show=ne($Option.item.additional_price,'')}
                {section show=eq(sum($Option.index,1), $MultiOption.item.default_value)}
                    <option value="{$Option.item.id}" selected="selected">{$Option.item.value}-{$Option.item.additional_price|l10n(currency)}</option>
                {section-else}
                    <option value="{$Option.item.id}">{$Option.item.value}-{$Option.item.additional_price|l10n(currency)}</option>
                {/section}
            {section-else}
                {section show=eq(sum($Option.index,1), $MultiOption.item.default_value)}
                    <option value="{$Option.item.id}" selected="selected">{$Option.item.value}</option>
                {section-else}
                    <option value="{$Option.item.id}">{$Option.item.value}</option>
                {/section}
            {/section}
        {/section}
    </select>
{/section}