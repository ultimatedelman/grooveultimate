---
layout: page
year: 2015
title: 2015 Calendar
bodyClass: calendar
---

{% assign events = site.data.events | where: "year", page.year |  reverse %}
{% for event in events %}
<h3> {{event.title}}</h3>

 **{{event.month}} {{event.dates}}, {%if event.time %}{{event.time}}{% else %}TBD{% endif %}** | {%if event.location %}{%if event.address%}[{{event.location}}]({{event.address}}){% else %}{{event.location}}{% endif %}{% else %}Location TBD{% endif %}

{%if event.description %}{{event.description}}{% endif %}
{% endfor %}
