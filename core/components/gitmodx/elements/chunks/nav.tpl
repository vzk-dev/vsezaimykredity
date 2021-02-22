<div class="bg-menu">
    <div class="container">
        <div class="menu">
            <nav id="nav-menu" class="nav-menu">
               {'!pdoMenu' | snippet : [
                    'parents' => 0,
                    'level' => 1,
                    'tplOuter' => '@INLINE <ul>{$wrapper}</ul>',
                    'tpl' => '@INLINE <li {$classes}><a class="nav-menu__link" href="{$link}" {$attributes}>{$menutitle}</a>{$wrapper}</li>'
                ]}
            </nav>
            {*<div class="nav-number">
                <div class="nav-number__image">
                    <img src="/assets/template/assets/img/pepa.png" alt="">
                </div>
                <div class="nav-number__number">225</div>
                <div class="nav-number__text">одобренных<br/> заявок за неделю</div>
            </div>*}
        </div>
    </div>
</div>