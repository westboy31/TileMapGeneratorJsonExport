To use the extension in html file you have to download and import the file **tmgJS.js** than use function **tmgDraw**

**example :**

```html
  <script type="module" src="./tmgJS.js" charset="utf-8"></script>
  <script type="module">
   import {tmgDraw} from "./tmgJS.js" ;
   const canvas = document.createElement("canvas");
   document.body.appendChild(canvas);
   tmgDraw(canvas,"Folder",true);
  </script>
```

**tmgDraw()** takes 3 parameters :

1. The canvas dom element where to draw
2. The path folder of the folder that contains the json and the pictures 
3. A boolean, if true resize the canvas to the size of the map 
