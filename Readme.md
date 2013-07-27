
![](https://dl.dropbox.com/u/30162278/ember-upload.png) 

Install
---

    $ component install kelonye/ember-upload


Example
---
    
    $ make example

Use
---

```javascript
var upload = require('ember-upload')('/upload-path');
upload.addObserver('upload.progress', function(){
  var progress = this.get('upload.progress');
  console.log(progress);
});
```

```html
{{view upload.ProgressView}}
{{view upload.DropView}}
```

License
---

MIT