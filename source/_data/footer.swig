{%- if theme.footer.powered and theme.footer.hosted.enable %}
  <span class="post-meta-divider">|</span>
{%- endif %}

{%- if theme.footer.hosted.enable %}
  <div class="hosted-by">{#
  #}部署在 {{ next_url("https://pages.github.com", "Github Pages") }} & {{ next_url("https://netlify.com", "Netlify") }}{#
#}</div>
{%- endif %}

<script {{ pjax }}>
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
      if (src !== null) {
        src = src.replace(/\.jpg$/, '.webp').replace(/\.png$/, '.webp');
        e.setAttribute('data-src', src);
      }
      src = e.getAttribute('src')
      if (src !== null) {
        src = src.replace(/\.jpg$/, '.webp').replace(/\.png$/, '.webp');
        e.setAttribute('src', src);
      }
    }
  });
}
checkWebp(showImage);
</script>
