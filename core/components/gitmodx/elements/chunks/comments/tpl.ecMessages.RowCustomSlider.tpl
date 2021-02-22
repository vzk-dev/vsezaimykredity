<div class="swiper-slide">
    <div class="review-slider-item">
        <div class="stars_new review-slider-rating">
            {set $hollow_count = 5 - $rating}
            {for $counter=1 to=$rating step=1}
                <span class="star_new star_new_full"></span>
            {/for}
            {for $counter=1 to=$hollow_count step=1}
                <span class="star_new star_new_hollow"></span>
            {/for}
        </div>
        <div class="review-slider-item__name" >{$user_name}</div>
        <div class="review-slider-item__text">{$text | limit : 180}</div>
        <div class="review-slider-item__gimme_more">Показать весь отзыв</div>
        <div class="review-slider-item__hidden_content">
            {if $user_contacts}
                <div class="review-slider-item__title green">
                    Достоинства
                </div>
                <div class="review-slider-item__text">
                    {$user_contacts}
                </div>
            {/if}
            {if $subject}
                <div class="review-slider-item__title red">
                    Недостатки
                </div>
                <div class="review-slider-item__text">
                    {$subject}
                </div>
            {/if}
            <div class="review-slider-item__title blue">
                Общие впечатления
            </div>
            <div class="review-slider-item__text">
                {$text}
            </div>
        </div>
    </div>
</div>