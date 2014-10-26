---
layout: page
year: 2014
title: 2014 Roster
bodyClass: roster
---

{% for player in site.data.players %} 
	{% if player.lastYear == page.year %}
* <b>{{player.number}}</b> [{{player.name}}]({{player.permalink}}) {% if player.isCaptain %}(captain){% endif %}{% if player.isPractice %}(pp){% endif %}{% if player.isCoach %}(coach){% endif %}
	{% endif %}
{% endfor %}