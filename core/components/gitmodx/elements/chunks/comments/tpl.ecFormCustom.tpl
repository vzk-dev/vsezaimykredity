<div class="review-form mb-4">
    <form class="form well ec-form" method="post" role="form" id="ec-form-{$fid}" data-fid="{$fid}" action="">
        <div class="review-form__header">
            <div class="review-form__title">
                Общая оценка компании
            </div>
            <input type="hidden" name="rating" id="ec-rating-{$fid}" value="{$rating}" />
            <div class="ec-rating ec-clearfix" data-storage-id="ec-rating-{$fid}">
                <div class="ec-rating-stars">
                    <span data-rating="1" data-description="{'ec_fe_message_rating_1' | lexicon}"></span>
                    <span data-rating="2" data-description="{'ec_fe_message_rating_2' | lexicon}"></span>
                    <span data-rating="3" data-description="{'ec_fe_message_rating_3' | lexicon}"></span>
                    <span data-rating="4" data-description="{'ec_fe_message_rating_4' | lexicon}"></span>
                    <span data-rating="5" data-description="{'ec_fe_message_rating_5' | lexicon}"></span>
                </div>
                <div class="ec-rating-description">{'ec_fe_message_rating_0' | lexicon}</div>
            </div>
            <span class="ec-error help-block" id="ec-rating-error-{$fid}"></span>
        </div>
        <div class="review-form__content">

            <div class="row">
                <div class="col-12 col-md-6">
                    <div class="form-item review-form__textarea">
                        <div class="review-form__textarea-title green">Опишите достоинства</div>
                        <textarea name="user_contacts" id="ec-user_contacts-{$fid}">{$user_contacts}</textarea>
                        <span class="ec-error help-block" id="ec-user_contacts-error-{$fid}"></span>
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <div class="form-item review-form__textarea">
                        <div class="review-form__textarea-title red">Укажите на недостатки</div>
                        <textarea name="subject" id="ec-subject-{$fid}">{$subject}</textarea>
                        <span class="ec-error help-block" id="ec-subject-error-{$fid}"></span>
                    </div>
                </div>
            </div>

            <div class="form-item">
                <textarea id="ec-text-{$fid}" placeholder="Общие впечатления о компании" name="text">{$text}</textarea>
                <span class="ec-error help-block" id="ec-text-error-{$fid}"></span>
            </div>

            <div class="row">
                <div class="col-12 col-md-6">
                    <div class="form-item">
                        <input id="ec-user_name-{$fid}" type="text" name="user_name" placeholder="Ваше имя" value="{$user_name}">
                        <span class="ec-error help-block" id="ec-user_name-error-{$fid}"></span>
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <div class="form-item">
                        <input type="email" name="user_email" placeholder="e-mail (необязательно)" id="ec-user_email-{$fid}" value="{$user_email}">
                        <span class="ec-error help-block" id="ec-user_email-error-{$fid}"></span>
                    </div>
                </div>
            </div>

            {$recaptcha}

            <button type="submit" name="send" class="btn" >Добавить отзыв</button>

        </div>

        <input type="hidden" name="thread" value="{$thread}">

        <div class="form-group ec-antispam">
            <label for="ec-{$antispam_field}-{$fid}" class="control-label">{'ec_fe_message_antismap' | lexicon}</label>
            <input type="text" name="{$antispam_field}" class="form-control" id="ec-{$antispam_field}-{$fid}" value="" />
        </div>
    </form>
</div>
<div id="ec-form-success-{$fid}"></div>