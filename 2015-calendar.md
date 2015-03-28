---
layout: page
year: 2015
title: 2015 Calendar
bodyClass: calendar
---

{% for event in site.data.events %}
	{% if event.year == page.year %}
* <h3><b>{{event.month}} {{event.dates}}</b> {{event.title}}</h3>
{%if event.description %}{{event.description}}{% endif %}
Time: {%if event.time %}{{event.time}}{% else %}TBD{% endif %}</br>
Location: {%if event.location %}{{event.location}} {%if event.address%} ([map]({{event.address}})) {% endif %}{% else %}TBD{% endif %}
    {% endif %}
{% endfor %}
