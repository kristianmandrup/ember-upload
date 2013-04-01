
![](https://dl.dropbox.com/u/30162278/ember-upload.png) 

Install
---

    $ component install kelonye/ember-upload


Example
---
    
    $ make example

Usage
---

```
.js
var upload = require('ember-upload')('/upload-path');
upload.addObserver('upload.progress', function(){
  var progress = this.get('upload.progress');
  console.log(progress);
});

.hbs
{{view upload.ProgressView}}
{{view upload.InputView}}
{{view upload.DropView}}
```

Todo
---

  - test

License
---

MIT