{let page_limit=6}

<form action={concat("class/classlist/",$GroupID)|ezurl} method="post" name="ClassList">

{switch name=Sw1 match=$class_count}
  {case match=0}
    <div class="feedback">
    <h2>{"No classes in "|i18n("design/standard/class/view")}{$group_name|wash}.</h2>
    <p>{"Click on the 'New' button to create a class."|i18n("design/standard/class/view")}</p>
    </div>
  {/case}
  {case}
    <div class="maincontentheader">
    <h1>{"Classes in"|i18n("design/standard/class/view")} {$group_name|wash}</h1>
    </div> 
  {/case}
{/switch}
<table class="list" width="100%" cellpadding="0" cellspacing="0" border="0">
{section show=$groupclasses}
<tr>
    <th>{"ID"|i18n("design/standard/class/view")}</th>
    <th>{"Name"|i18n("design/standard/class/view")}</th>
    <th>{"Identifier"|i18n("design/standard/class/view")}</th>
    <th>{"Modifier"|i18n("design/standard/class/view")}</th>
    <th>{"Modified"|i18n("design/standard/class/view")}</th>
    <th>{"Edit"|i18n("design/standard/class/view")}</th>
    <th>{"Copy"|i18n("design/standard/class/view")}</th>
    <th>{"Remove"|i18n("design/standard/class/view")}</th>
</tr>

{section name=Classes loop=$groupclasses sequence=array(bglight,bgdark)}
<tr>
    <td class="{$Classes:sequence}" width="1%"><a href={concat( "/class/view/", $Classes:item.id )}>{$Classes:item.id}</a></td>
    <td class="{$Classes:sequence}"><a href={concat( "/class/view/", $Classes:item.id )}>{$Classes:item.name|wash}</a></td>
    <td class="{$Classes:sequence}">{$Classes:item.identifier|wash}</td>
    <td class="{$Classes:sequence}">{content_view_gui view=text_linked content_object=$Classes:item.modifier.contentobject}</td>
    <td class="{$Classes:sequence}"><span class="small">{$Classes:item.modified|l10n(shortdatetime)}</span></td>
    <td class="{$Classes:sequence}" width="1%"><div class="listbutton"><a href={concat("class/edit/",$Classes:item.id)|ezurl}><img class="button" src={"edit.png"|ezimage} width="16" height="16" alt="edit" /></a></div></td>
    <td class="{$Classes:sequence}" width="1%"><div class="listbutton"><a href={concat("class/copy/",$Classes:item.id)|ezurl}><img class="button" src={"copy.gif"|ezimage} width="16" height="16" alt="edit" /></a></div></td>
    <td class="{$Classes:sequence}" width="1%"><div align="right"><input type="checkbox" name="DeleteIDArray[]" value="{$Classes:item.id}"></div></td>
</tr>
{/section}
{/section}

<tr>
  <td>
    <div class="buttonblock">
    {include uri="design:gui/button.tpl" name=new id_name=NewButton value="New class"|i18n("design/standard/class/view")}
    </div>
  </td>
  <td colspan="7" align="right">
    {section show=$class_count}
      <input type="image" name="RemoveButton" value="{'Remove'|i18n('design/standard/class/view')}" src={"trash.png"|ezimage} />
    {/section}
  </td>
</tr>
</table>

<input type="hidden" name = "CurrentGroupID" value="{$GroupID}" />
<input type="hidden" name = "CurrentGroupName" value="{$group_name}" />

{let latest_classes=fetch( class, latest_list, hash( limit, $page_limit ) )}

{section show=$latest_classes}
    <div class="maincontentheader">
        <h1>{"Last modified classes"|i18n("design/standard/class/list")}</h1>
    </div>
    <table class="list" width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <th>{"ID"|i18n("design/standard/class/view")}</th>
        <th>{"Name"|i18n("design/standard/class/view")}</th>
        <th>{"Identifier"|i18n("design/standard/class/view")}</th>
        <th>{"Modifier"|i18n("design/standard/class/view")}</th>
        <th>{"Modified"|i18n("design/standard/class/view")}</th>
        <th>{"Edit"|i18n("design/standard/class/view")}</th>
        <th>{"Copy"|i18n("design/standard/class/view")}</th>
    </tr>

    {section var=class loop=$latest_classes sequence=array( bglight, bgdark )}
        <tr>
            <td class="{$class.sequence}" width="1%"><a href={concat( "/class/view/", $class.item.id )|ezurl}>{$class.item.id}</a></td>
            <td class="{$class.sequence}"><a href={concat( "/class/view/", $class.item.id )|ezurl}>{$class.item.name|wash}</a></td>
            <td class="{$class.sequence}">{$class.item.identifier|wash}</td>
            <td class="{$class.sequence}">{content_view_gui view=text_linked content_object=$class.item.modifier.contentobject}</td>
            <td class="{$class.sequence}"><span class="small">{$class.item.modified|l10n(shortdatetime)}</span></td>
            <td class="{$class.sequence}" width="1%"><div class="listbutton"><a href={concat("class/edit/",$class.item.id)|ezurl}><img class="button" src={"edit.png"|ezimage} width="16" height="16" alt="edit" /></a></div></td>
            <td class="{$class.sequence}" width="1%"><div class="listbutton"><a href={concat("class/copy/",$class.item.id)|ezurl}><img class="button" src={"copy.gif"|ezimage} width="16" height="16" alt="edit" /></a></div></td>
        </tr>
    {/section}
    </table>
{/section}

{/let}

</form>

{/let}
