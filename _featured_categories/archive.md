---
layout: page
title: Archive
permalink: /archive/
slug: archive
menu: true
submenu: false
order: 9
description: >
  
---


<div class="well article">
{%for post in site.posts %}
    {% unless post.next %}
        <h2>{{ post.date | date: '%Y' }}</h2>
        <ul>
    {% else %}
        {% capture year %}{{ post.date | date: '%Y' }}{% endcapture %}
        {% capture nyear %}{{ post.next.date | date: '%Y' }}{% endcapture %}
        {% if year != nyear %}
            </ul>
            <h3>{{ post.date | date: '%Y' }}</h3>
            <ul>
        {% endif %}
    {% endunless %}
    <li>
        <span class="post-date">
        {% assign date_format = site.date_format.archive %}
        {{ post.date | date: '%Y-%m-%d' }} 
        <a href=".{{ post.url }}" target="_blank">{{ post.title }}</a>
        </span>
    </li>
{% endfor %}
</ul>
</div>
view rawarchive.txt hosted with ❤ by GitHub