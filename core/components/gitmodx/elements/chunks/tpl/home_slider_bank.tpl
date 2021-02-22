{if $is_slider}
    <div class="swiper-slide">
{/if}
    <a href="{$id | url}">
        <div class="banki-list">
            <img class="banki-list__image" src="{'!pdoField' | snippet : [ 'id' => $id, 'field' => 'img', 'top'=>0]}" alt="{$pagetitle}">
        </div>
    </a>
{if $is_slider}
    </div>
{/if}