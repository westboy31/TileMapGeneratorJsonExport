To use the extension in html file you have to download and import the file **tmgJS.js** than use function **tmgDraw**

**example :**

```html
  <script type="module" src="../tmgJS.js" charset="utf-8"></script>
  <script type="module">
   import {tmgDraw} from "../tmgJS.js" ;
   const canvas = document.createElement("canvas");
   document.body.appendChild(canvas);
   tmgDraw(canvas,"Folder",true);
  </script>
```

