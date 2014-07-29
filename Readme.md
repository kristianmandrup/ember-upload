
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
var Upload = require('ember-upload')('/upload-path');
Upload.addObserver('upload.progress', function(){
  var progress = this.get('upload.progress');
  console.log(progress);
});
```

```html
{{view Upload.ProgressView}}
{{#view Upload.DropView}}
  Upload or Drop files here
{{/view}}
```

S3 example:

```javascript

var upload = require('ember-upload');
var slug = require('slug'); // yields/slug

var S3 = {
  policy: '',
  signature: '',
  key: AWS_ACCESS_KEY_ID,
  acl: 'public-read',
  bucket: '',
  region: 's3-us-west-2'
   
};

S3.url = 'http://'+S3.bucket+'.'+S3.region+'.amazonaws.com/';
S3.staticUrl = 'https://'+S3.region+'.amazonaws.com/'+S3.bucket+'/';

App.UploadView = Em.View.extend({

  init: function(){

    var self = this;
    var key = slug((new Date).toISOString());
    var opts = {
      'key': key,
      'AWSAccessKeyId': S3.key,
      'acl': S3.acl,
      'policy': S3.policy,
      'signature': S3.signature,
      'Content-Type': 'application/octet-stream'
    };

    this.upload = upload(S3.url, opts);
    this.upload.addObserver('upload.loadend', function(){
      Em.run.later(function(){
        var path = S3.staticUrl + key;
        console.log('S3 path: %s', path);
      }, 2000);
    });

    this._super();

  }
});

```

Todo
---

X-browser.

License
---

MIT