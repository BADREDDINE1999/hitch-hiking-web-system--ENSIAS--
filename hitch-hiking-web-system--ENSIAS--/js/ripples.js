window.ripples={init:function(a){"use strict";function b(a,b){var c=a.matches||a.matchesSelector||a.webkitMatchesSelector||a.mozMatchesSelector||a.msMatchesSelector||a.oMatchesSelector;return c.call(a,b)}var c=100,d=500,e=function(a,c,d){"string"==typeof a&&(a=[a]),a.forEach(function(a){document.addEventListener(a,function(a){var e="number"!=typeof a.detail?a.detail:a.target;b(e,c)&&d(a,e)})})},f=function(a,b,c){var n,e=b,f=e.parentNode,g=document.createElement("div"),h=f.getBoundingClientRect(),i={x:a.clientX-h.left,y:(window.ontouchstart?a.clientY-window.scrollY:a.clientY)-h.top},k="scale("+Math.round(e.offsetWidth/5)+")",l=new CustomEvent("rippleEnd",{detail:g}),m=.3;a.touches&&(i={x:a.touches[0].clientX-h.left,y:a.touches[0].clientY-h.top}),j=g,g.className="ripple",g.setAttribute("style","left:"+i.x+"px; top:"+i.y+"px;");var o=window.getComputedStyle(f).color;o=o.replace("rgb","rgba").replace(")",", "+m+")"),e.appendChild(g),n=window.getComputedStyle(g).opacity,g.dataset.animating=1,g.className="ripple ripple-on";var p=[g.getAttribute("style"),"background-color: "+o,"-ms-transform: "+k,"-moz-transform"+k,"-webkit-transform"+k,"transform: "+k];g.setAttribute("style",p.join(";")),setTimeout(function(){g.dataset.animating=0,document.dispatchEvent(l),c&&c()},d)},g=function(a){a.className="ripple ripple-on ripple-out",setTimeout(function(){a.remove()},c)},h=!1;e(["mousedown","touchstart"],"*",function(){h=!0}),e(["mouseup","touchend","mouseout"],"*",function(){h=!1});var j,i=function(a,b){if(0===b.getElementsByClassName("ripple-wrapper").length){b.className+=" withripple";var c=document.createElement("div");c.className="ripple-wrapper",b.appendChild(c),null===window.ontouchstart&&f(a,c,function(){c.getElementsByClassName("ripple")[0].remove()})}};e(["mouseover","touchstart"],a,i),e(["mousedown","touchstart"],".ripple-wrapper",function(a,b){(0===a.which||1===a.which||2===a.which)&&f(a,b)}),e("rippleEnd",".ripple-wrapper .ripple",function(a,b){var c=b.parentNode.getElementsByClassName("ripple");(!h||c[0]==b&&c.length>1)&&g(b)}),e(["mouseup","touchend","mouseout"],".ripple-wrapper",function(){var a=j;a&&1!=a.dataset.animating&&g(a)})}};