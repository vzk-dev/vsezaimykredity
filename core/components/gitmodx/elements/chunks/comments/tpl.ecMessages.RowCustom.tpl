<div id="ec-{$thread_name}-message-{$id}" class="full-reviews" itemscope itemtype="https://schema.org/Review">
    <div class="reviews-value">
        <div class="reviews-value-client">
            <div class="reviews-value-client__data" itemprop="datePublished" content="{$date}">{$date | dateAgo}</div>
            <div class="reviews-value-client__author" itemprop="author">{$user_name}</div>
            {*<div class="reviews-value-client__city">г. Москва</div>*}
        </div>
        <div class="ec-stars" itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">
            <meta itemprop="worstRating" content = "1">
            <meta itemprop="bestRating" content = "5">
            <meta itemprop="ratingValue" content = "{$rating}">
            <span class="rating-{$rating}"></span>
        </div>
    </div>
    {if $user_contacts || $subject}
    {if $user_contacts }
    <div class="reviews-value__content">
        <div class="reviews-value__title reviews-value__title--plus">Достоинства</div>
        <div class="reviews-value__text" itemprop="reviewBody">{$user_contacts}</div>
    </div>
    {/if}
    {if $subject }
    <div class="reviews-value__content">
        <div class="reviews-value__title reviews-value__title--minus">Недостатки</div>
        <div class="reviews-value__text" itemprop="reviewBody">{$subject}</div>
    </div>
    {/if}
    {/if}
    {if $text}
    <div class="reviews-value__content">
        <div class="reviews-value__title reviews-value__title--text">Общие впечатления</div>
        <div class="reviews-value__text" itemprop="reviewBody">{$text}</div>
    </div>
    {/if}
</div><!-- /.product-reviews -->