{%- if theme.footer.theme.enable and theme.footer.hosted.enable %}
  <span class="post-meta-divider">|</span>
{%- endif %}

{%- if theme.footer.hosted.enable %}
  <div class="hosted-by">{#
  #}{{ __('footer.hosted', next_url(theme.footer.hosted.url, theme.footer.hosted.host, {class: 'host-link'})) }}{#
#}</div>
{%- endif %}

<script{{ pjax }}>
function checkWebp(callback) {
    var img = new Image();
    img.onload = function () { callback((img.width > 0) && (img.height > 0)); };
    img.onerror = function () { callback(false); };
    img.src = 'data:image/webp;base64,UklGRiIAAABXRUJQVlA4IBYAAAAwAQCdASoBAAEADsD+JaQAA3AAAAAA';
}
function showImage(useWebp) {
    var imgs = [].slice.call(document.querySelectorAll('img'));
    imgs.forEach(function (e) {
        if (useWebp) {
            var src = e.getAttribute('data-src')
            src = src.replace(/\.jpg$/, '.webp').replace(/\.png$/, '.webp');
            e.setAttribute('data-src', src);
        }
    });
}
checkWebp(showImage);
</script>
