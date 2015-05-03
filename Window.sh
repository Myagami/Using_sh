#!/bin/bash 

export MAIN_DIALOG=' 
 <window> 
  <vbox> 
   <hbox> 
<text><label>Wiki</label></text>
<entry>
<variable>Wiki_Page</variable>
</entry>
   </hbox> 
   <hbox> 
<text><label>Name</label></text>
<entry>
<variable>Get_Page</variable>
</entry>
<button>
<label>Get!</label>
<action>wget -O "$Name" "http://ja.wikipedia.org/wiki/$Wiki_Page"; </action>
</button>
   </hbox> 

  </vbox> 

 </window> 
' 

gtkdialog -p MAIN_DIALOG -c 