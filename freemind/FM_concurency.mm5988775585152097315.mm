<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1570037429260" ID="ID_719295023" LINK="https://www.youtube.com/watch?v=iiAhHEuUgy8&amp;list=PLECBD29A17AAF6EF9&amp;index=9&amp;t=132s" MODIFIED="1570037502277" TEXT="Concurrency">
<node CREATED="1570037508427" ID="ID_1090986267" MODIFIED="1570038597296" POSITION="right" TEXT="Type of concurrency">
<node CREATED="1570037535586" ID="ID_1091817187" MODIFIED="1570037538529" TEXT="Intra-computer">
<node CREATED="1570037538847" ID="ID_1640006777" MODIFIED="1570037548431" TEXT="Cores within one machine">
<node CREATED="1570037550930" ID="ID_1698973541" MODIFIED="1570037553252" TEXT="multi-core"/>
</node>
<node CREATED="1570037557600" ID="ID_865857099" MODIFIED="1570037570422" TEXT="GPU"/>
</node>
<node CREATED="1570037572070" ID="ID_1206866077" MODIFIED="1570037575552" TEXT="Inter-computer">
<node CREATED="1570037575880" ID="ID_1384909869" MODIFIED="1570037580422" TEXT="Different machines"/>
<node CREATED="1570037581160" ID="ID_1215842874" MODIFIED="1570037585833" TEXT="Distributed computing"/>
<node CREATED="1570037586941" ID="ID_792476365" MODIFIED="1570037593423" TEXT="Grid and cluster computing"/>
</node>
</node>
<node CREATED="1570038348175" ID="ID_842073169" MODIFIED="1570038350707" POSITION="right" TEXT="Thread">
<node CREATED="1570038350925" ID="ID_1660489947" MODIFIED="1570038354527" TEXT="Single path of flow">
<node CREATED="1570039949708" ID="ID_1357560058" MODIFIED="1570039954710" TEXT="&quot;thread of execution&quot;"/>
</node>
<node CREATED="1570039971752" ID="ID_1189000712" MODIFIED="1570039975843" TEXT="Single CPU / core">
<node CREATED="1570039976411" ID="ID_1200531401" MODIFIED="1570039986113" TEXT="Can execute many threads">
<node CREATED="1570039990519" ID="ID_542686391" MODIFIED="1570040000493" TEXT="&quot;Time Division Multipexing&quot;"/>
<node CREATED="1570040010861" ID="ID_695515663" MODIFIED="1570040012233" TEXT="Example">
<node CREATED="1570040003741" ID="ID_472044528" MODIFIED="1570040010343" TEXT="Execute multiple program at once">
<node CREATED="1570040016141" ID="ID_440441925" MODIFIED="1570040017943" TEXT="Movie"/>
<node CREATED="1570040019171" ID="ID_1358082372" MODIFIED="1570040020063" TEXT="Game"/>
</node>
</node>
</node>
</node>
<node CREATED="1570039928738" ID="ID_1354784936" MODIFIED="1570039931840" TEXT="multithreading">
<node CREATED="1570039932069" ID="ID_272381692" MODIFIED="1570039942081" TEXT="multiple threads through same hardware"/>
<node CREATED="1570040069595" ID="ID_884873714" MODIFIED="1570040079768" TEXT="... with multiple cores"/>
</node>
</node>
<node CREATED="1570037811674" ID="ID_980247564" MODIFIED="1570037827258" POSITION="right" TEXT="Problem in concurrency">
<node CREATED="1570037817274" ID="ID_1296477540" MODIFIED="1570037818806" TEXT="Memory"/>
<node CREATED="1570037819454" ID="ID_1669686618" MODIFIED="1570037824037" TEXT="Management of shared resources"/>
</node>
<node CREATED="1570038554011" ID="ID_1452123034" MODIFIED="1570038558743" POSITION="right" TEXT="Why multi core processor">
<node CREATED="1570038558941" ID="ID_1026185401" MODIFIED="1570038571933" TEXT="Could not do smaller logic gates"/>
<node CREATED="1570038572431" ID="ID_1966038796" MODIFIED="1570038583623" TEXT="Heat to high - impossible to dissipate"/>
<node CREATED="1570038845177" FOLDED="true" ID="ID_289365810" MODIFIED="1660307311614" TEXT="img">
<icon BUILTIN="licq"/>
<node CREATED="1570038848066" ID="ID_570327737" MODIFIED="1570038852001">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="moore_law_concurency.png" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1570039880668" ID="ID_1238489925" MODIFIED="1570039890280" TEXT="It&apos;s a retreat from physic challenge"/>
</node>
<node CREATED="1570040123643" ID="ID_230329681" MODIFIED="1570040132895" POSITION="left" TEXT="Amdahl&apos;s Law">
<node CREATED="1570040133213" ID="ID_827718764" MODIFIED="1570040136055" TEXT="Program has">
<node CREATED="1570040136273" ID="ID_1378124982" MODIFIED="1570040140915" TEXT="A parallel portion"/>
<node CREATED="1570040141393" ID="ID_32790031" MODIFIED="1570040145270" TEXT="A serial portion">
<node CREATED="1570040145568" ID="ID_138323898" MODIFIED="1570040148270" TEXT="Bottleneck"/>
</node>
</node>
</node>
<node CREATED="1570040505921" ID="ID_206441734" MODIFIED="1570040513403" POSITION="left" TEXT="Even if no sequential portions">
<node CREATED="1570040513631" ID="ID_423993588" MODIFIED="1570040520483" TEXT="Time to think how to divide the problem up"/>
<node CREATED="1570040521141" ID="ID_282614561" MODIFIED="1570040531190" TEXT="Time to hand out small &quot;work units&quot; to workers"/>
<node CREATED="1570040532358" ID="ID_1835064203" MODIFIED="1570040539450" TEXT="All workers may not work equally fast"/>
<node CREATED="1570040539888" ID="ID_870241596" MODIFIED="1570040544040" TEXT="Some workers may fail"/>
<node CREATED="1570040544518" ID="ID_883593883" MODIFIED="1570040554300" TEXT="There may be contention for shared resources"/>
<node CREATED="1570040554868" ID="ID_1383129792" MODIFIED="1570040565275" TEXT="Workers could overwriting each others&apos; answers"/>
<node CREATED="1570040565963" ID="ID_1009228832" MODIFIED="1570040579725" TEXT="You may have to wait until the last worker returns to proced">
<node CREATED="1570040579993" ID="ID_1080264380" MODIFIED="1570040593681" TEXT="Slowest link problem"/>
<node CREATED="1570040582403" ID="ID_931131286" MODIFIED="1570040590451" TEXT="Weakest link problem"/>
</node>
<node CREATED="1570040594989" ID="ID_194556538" MODIFIED="1570040603654" TEXT="There&apos;s time to put the data back together"/>
<node CREATED="1570040609182" ID="ID_1569886850" MODIFIED="1570040617234" TEXT="... in a way that looks as if it were done by one"/>
</node>
<node CREATED="1570040920635" ID="ID_724989078" MODIFIED="1570040922567" POSITION="left" TEXT="Problem">
<node CREATED="1570040922725" ID="ID_902010384" MODIFIED="1570040924577" TEXT="Race condition">
<node CREATED="1570040924755" ID="ID_880573086" MODIFIED="1570040937999" TEXT="Modifying states with two threads"/>
</node>
<node CREATED="1570040939319" ID="ID_875863915" MODIFIED="1570040968094" TEXT="Deadlocks"/>
</node>
</node>
</map>
