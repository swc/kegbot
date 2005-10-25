<div class="contenthead">

   welcome{if $s_drinker->username}, {$s_drinker->username}{/if}
</div>
<div class="content">
   <p>
   this is the kegbot kegerator! for more information, see the <a
   href="http://hoho.com/mike/kegbot">project page</a>.
   </p>
</div>
<div class="contenthead">
   last five drinks
</div>
<div class="content">
   {if !$last_drinks}
   <p>
   virgin kegbot; no drinks yet recorded! this is indeed a very special time...
   </p>
   {else}
   <p>
   <div align="center">
   <table border="0" cellspacing="1" cellpadding="1">
   <tr>
   <td>&nbsp;</td>
   { foreach name=drinks item="drink" from=$last_drinks }
      <td>
         <center>
         {include file="mugshot-box.tpl" u=$drink->drinker_obj d="72" href="drink-info.php?drink=`$drink->id`" border=1}
         </center>
      </td>
      <td>&nbsp;</td>
   {/foreach}
   </tr>
   <tr>
      <td>&nbsp;</td>
   { foreach name=drinks item="drink" from=$last_drinks }
      <td align="center">
         {$drink->getSize()|string_format:"%.2f"} oz
      </td>
      <td>&nbsp;</td>
   {/foreach}
   </tr>
   </table>
   </div>
   </p>
   <p>
   <div class="box">
   <table cellspacing=0 border=0 width="430">
   <tr>
      <td>&nbsp;</td>
      <td align="right"><b>size</b></td>
      <td>&nbsp;</td>
      <td align="right" colspan="2"><b>calories</b>&nbsp;&nbsp;</td>
      <td><b>user</b></td>
      <td><b>when</b></td>
      <td><b>bac</b></td>
   </tr>
   { foreach name=drinks item="drink" from=$last_drinks }
      { include file="drink-span.tpl" drink=$drink } 
   { /foreach }
   </table>
   </div>
   {/if}
   </p>
</div>

<div class="contenthead">
   current drunks!
</div>
<div class="content">
   <p>
   {if $drunks}
      <table cellspacing=0 width="430">
         <tr>
            <td><b>drinker</b></td>
            <td><b>current bac</b></td>
         </tr>
      {foreach name=drunks item="drinker" from=$drunks}
         {include file="bac-leaders.tpl" drinker=$drinker }
      {/foreach}
      </table>
   {else}
   all drinkers appear to be sober right now. i am lonely.
   {/if}
   </p>
</div>

<div class="contenthead">
   current keg status
</div>
<div class="content">
   <p>
      <center>
         <b><a href="/keg-info.php?keg={$curr_keg->id}">{$curr_keg->beername}</a></b>; {$curr_keg->alccontent|string_format:"%.1f"}% abv; <i>{$curr_keg->status}</i>; {$keg_temp_c|string_format:"%.2f"} &deg;C / {$keg_temp_f|string_format:"%.2f"} &deg;F<br>
      </center>
   </p>
   <p>
      <div class="box">
      <img src="/graphs/gen-graph.php?g=current-temps&d={$graphdays}"><br>
      <!-- <center>[<a href="?d=1">1day</a>] [<a href="?d=3">3day</a>] [<a href="?d=7">7day</a>]</center> -->
      <img src="/graphs/gen-graph.php?g=current-fridge&d={$graphdays}"><br>
      </div>
   </p>
   <p>
      sensor data is collected every 30 seconds, and this graph is refreshed at
      least once per minute. note that the stated accuracy of the temperature
      sensors is a rather large &#177;0.5 &deg;C.
   </p>
   <p>
      the moving average is computed only for the primary sensor, and is based
      on the last 30 points, or roughly, the last 15 minutes of measurements.
</div>

<div class="contenthead">
   tags
</div>
<div class="content">
   <p>
   {if $s_drinker}
   {foreach from=$tags item="tag"}
   {include file="tag-line.tpl"}
   {/foreach}
   {else}
   must be logged in to view tags
   {/if}
   </p>
</div>