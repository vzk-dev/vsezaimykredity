{*Точно нужно и работает корректно*}
<link href="/assets/template/js/fancybox/jquery.fancybox.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/css/select2.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/assets/components/easycomm/css/web/ec.default.css" type="text/css">
<script src="/assets/template/assets/js/jquery.min.js"></script>
<script src="/assets/template/js/jquery.form.js"></script>
<script src="/assets/template/js/fancybox/jquery.fancybox.min.js"></script>
<script src="/assets/template/js/cleave.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
{if $_modx->resource.template in [18]}
<script src="/assets/template/assets/js/ion.tabs-1.0.2/js/ion-tabs/ion.tabs.min.js"></script>
{/if}
{*<script src="/assets/template/assets/js/ion.rangeSlider-master/js/ion.rangeSlider.min.js"></script>*}
{if $_modx->resource.template in [18,25]}
<script src="/assets/template/assets/js/swiper-master/dist/js/swiper.min.js"></script>
{/if}
<script src="/assets/template/assets/js/jquery.show-more.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/js/select2.min.js"></script>
{if $_modx->resource.template not in [5,31]}
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/ui-darkness/jquery-ui.css">
{/if}
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>

{*<script src="/assets/template/js/html5.js"></script>*}


{*Для скрола*}
<script src="/assets/template/js/jquery.ba-throttle-debounce.min.js"></script>
<link rel="stylesheet" href="/assets/template/assets/css/scroller.css" type="text/css" />
<script src="/assets/template/js/scroller.js"></script>

<!-- main -->
<script src="/assets/template/assets/js/app.js"></script>
<script src="/assets/template/assets/js/dop_app.js"></script>
{if $_modx->resource.template not in [18,25,24,30]}
<script src="/assets/template/assets/js/calc.js"></script>
{/if}
<script src="https://kit.fontawesome.com/cbedd552c8.js" crossorigin="anonymous"></script>
<!-- scripts -->
<!-- Yandex.Metrika counter -->
<script type="text/javascript" >
   (function(m,e,t,r,i,k,a){ m[i]=m[i]||function(){ (m[i].a=m[i].a||[]).push(arguments) };
   m[i].l=1*new Date();k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a) })
   (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

   ym(70630705, "init", {
        clickmap:true,
        trackLinks:true,
        accurateTrackBounce:true,
        webvisor:true
   });
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/70630705" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-VTPSV0R4J4"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){ dataLayer.push(arguments); }
  gtag('js', new Date());

  gtag('config', 'G-VTPSV0R4J4');
</script>