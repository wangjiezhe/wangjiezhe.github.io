{%- if theme.footer.theme.enable and theme.footer.hosted.enable %}
  <span class="post-meta-divider">|</span>
{%- endif %}

{%- if theme.footer.hosted.enable %}
  <div class="hosted-by">{#
  #}{{ __('footer.hosted', next_url(theme.footer.hosted.url, theme.footer.hosted.host, {class: 'host-link'})) }}{#
#}</div>
{%- endif %}