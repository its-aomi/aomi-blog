---
title: "Lazy Loading Disqus Comments on Button Click"
description: "Using Javascript to lazy load disqus comments and loading it on button click."
date: 2024-02-14
author: Amitabh Borah
layout: post
permalink: /lazy-loading-disqus-comments-on-button-click/
categories: coding
tags: [coding, javscript]
image: "assets/images/lazy-loading-disqus-comments.jpg"
---

**Using Javascript to lazy load disqus comments and loading it on button click.**

So few months i was working on a static blog and wanted a comments system in it, i did some research and stumbled upon disqus which seemed to be the perfect solution.<br>

It was perfect until i checked page speed insights and found how horrible it is for page speed.<br>

Then i did what i am best at, creating a js script that will solve it.<br>

Below the is the code that does the job:

{% highlight javascript %}

// define a function to load Disqus comments

function loadDisqus() {
var disqus_config = function () {
// set your Disqus configuration variables here
};

// create the Disqus script element
var d = document, s = d.createElement('script');
s.src = 'https://op-c.disqus.com/embed.js';
s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);

// add an event listener to hide the "loading comments" text when Disqus is loaded
s.addEventListener('load', function() {
var loadingCommentsText = document.getElementById('loading-comments-text');
loadingCommentsText.style.display = 'none';
});
}

// get the "Show comments" button element and "loading comments" text element
var showCommentsButton = document.getElementById('show-comments-button');
var loadingCommentsText = document.getElementById('loading-comments-text');

// add a click event listener to the button
showCommentsButton.addEventListener('click', function() {
// show "loading comments" text
loadingCommentsText.style.display = 'inline';

// replace the "Show comments" button with the Disqus comments
var disqusThread = document.getElementById('disqus_thread');
disqusThread.style.display = 'block';
showCommentsButton.style.display = 'none';

// load the Disqus comments
loadDisqus();
});

{% endhighlight %}

Here just replace "https://op-c.disqus.com/embed.js" with your own disqus url and you are done.<br>

In html add the following for the button that will trigger the comments.

{% highlight html %}

<button id="show-comments-button">Show comments</button>
<span id="loading-comments-text" style="display: none;">Loading comments...</span>

<div id="disqus_thread" style="display: none;"></div>
         
{% endhighlight %}

Now by deafult only a show button will appear and when you click on it a text "Loading Comments" will show till disqus loads the comments.<br>

Feel free to contribute to the above code in the comments below.
