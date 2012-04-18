/*
 * Auto Expanding Text Area (1.2.2)
 * by Chrys Bader (www.chrysbader.com)
 * chrysb@gmail.com
 *
 * Special thanks to:
 * Jake Chapa - jake@hybridstudio.com
 * John Resig - jeresig@gmail.com
 *
 * Copyright (c) 2008 Chrys Bader (www.chrysbader.com)
 * Licensed under the GPL (GPL-LICENSE.txt) license.
 *
 *
 * NOTE: This script requires jQuery to work.  Download jQuery at www.jquery.com
 *
 */
(function(a){var b=null;a.fn.autogrow=function(b){return this.each(function(){new a.autogrow(this,b)})},a.autogrow=function(b,c){this.options=c||{},this.dummy=null,this.interval=null,this.line_height=this.options.lineHeight||parseInt(a(b).css("line-height")),this.min_height=this.options.minHeight||parseInt(a(b).css("min-height")),this.max_height=this.options.maxHeight||parseInt(a(b).css("max-height")),this.expand_callback=this.options.expandCallback,this.textarea=a(b),this.line_height==NaN&&(this.line_height=0),this.init()},a.autogrow.fn=a.autogrow.prototype={autogrow:"1.2.2"},a.autogrow.fn.extend=a.autogrow.extend=a.extend,a.autogrow.fn.extend({init:function(){var a=this;this.textarea.css({overflow:"hidden",display:"block"}),this.textarea.bind("focus",function(){a.startExpand()}).bind("blur",function(){a.stopExpand()}),this.checkExpand()},startExpand:function(){var a=this;this.interval=window.setInterval(function(){a.checkExpand()},400)},stopExpand:function(){clearInterval(this.interval)},checkExpand:function(){this.dummy==null&&(this.dummy=a("<div></div>"),this.dummy.css({"font-size":this.textarea.css("font-size"),"font-family":this.textarea.css("font-family"),width:this.textarea.css("width"),"padding-top":this.textarea.css("padding-top"),"padding-right":this.textarea.css("padding-right"),"padding-bottom":this.textarea.css("padding-bottom"),"padding-left":this.textarea.css("padding-left"),"line-height":this.line_height+"px","overflow-x":"hidden",position:"absolute",top:0,left:-9999}).appendTo("body"));var b=this.textarea.val().replace(/(<|>)/g,"");a.browser.msie?b=b.replace(/\n/g,"<BR>new"):b=b.replace(/\n/g,"<br>new"),this.dummy.html()!=b&&(this.dummy.html(b),this.max_height>0&&this.dummy.height()+this.line_height>this.max_height?this.textarea.css("overflow-y","auto"):(this.textarea.css("overflow-y","hidden"),(this.textarea.height()<this.dummy.height()+this.line_height||this.dummy.height()<this.textarea.height())&&this.textarea.animate({height:this.dummy.height()+this.line_height+"px"},100)));if(this.expand_callback){var c=this;window.setTimeout(function(){c.expand_callback()},500)}}})})(jQuery);