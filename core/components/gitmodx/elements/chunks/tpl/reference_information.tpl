<div class="reference-info-title">Справочная информация</div>
{if '!pdoField' | snippet : [ 'id' => $_modx->resource.641, 'field' => 'license']}
    <div class="reference-info-value">Лицензия №{$_modx->resource.license}</div>
{/if}
{if '!pdoField' | snippet : [ 'id' => $_modx->resource.641, 'field' => 'data_reg']}
    <div class="reference-info-value">Дата регистрации Банком России: {$_modx->resource.data_reg}</div>
{/if}
{if '!pdoField' | snippet : [ 'id' => $_modx->resource.641, 'field' => 'fio']}
    <div class="reference-info-value">Руководство: {$_modx->resource.fio}</div>
{/if}
{if '!pdoField' | snippet : [ 'id' => $_modx->resource.641, 'field' => 'address']}
    <div class="reference-info-value">Адрес: {$_modx->resource.address}</div>
{/if}
{if '!pdoField' | snippet : [ 'id' => $_modx->resource.641, 'field' => 'bik']}
    <div class="reference-info-value">БИК: {$_modx->resource.bik}</div>
{/if}
{if '!pdoField' | snippet : [ 'id' => $_modx->resource.641, 'field' => 'ogrn']}
    <div class="reference-info-value">ОГРН: {$_modx->resource.ogrn}</div>
{/if}
{if '!pdoField' | snippet : [ 'id' => $_modx->resource.641, 'field' => 'phone']}
    <div class="reference-info-value">Телефоны: <a href="tel:{$_modx->resource.phone|tel}">{$_modx->resource.phone}</a></div>
{/if}
{if '!pdoField' | snippet : [ 'id' => $_modx->resource.641, 'field' => 'link_to_site']}
    <div class="reference-info-value">Официальный сайт: <a href="https://{$_modx->resource.link_to_site}" rel="nofollow" target="_blank">{$_modx->resource.link_to_site}</a></div>
{/if}