#!/bin/bash


cat >~/stuff/Startpage/fortune.html <<EOL
<head>
<meta http-equiv="refresh" content="600" >
</head>
<body>
$(fortune -a)
</body>
EOL
#echo $(fortune -a)  > ~/stuff/Startpage/fortune.html
#sed -i 's/$/<br>/' ~/stuff/Startpage/fortune.html
#sed -i 's/ /\&nbsp;/g' ~/stuff/Startpage/fortune.html

