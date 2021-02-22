{'!pdoMenu' | snippet : [
    'parents' => $_modx->resource.parent,
    'tpl' => '@INLINE <li><a class="nav-sub__link" href="{$id | url}" {$attributes}>{$menutitle}</a>{$wrapper}</li>',
    'tplOuter' => '@INLINE <ul>{$wrapper}</ul>'
]}