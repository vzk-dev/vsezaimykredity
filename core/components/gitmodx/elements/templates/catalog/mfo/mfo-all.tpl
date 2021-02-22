{extends 'template:base'}
{block 'after_header'}{/block}
{block 'body'}

<section>
    <div class="container">
        {'!pdoCrumbs' | snippet : [
			'to' => $_modx->id,
			'showHome' => 1,
			'tpl' => 'bread_tpl',
			'tplWrapper' => 'bread_tplWrapper',
			'tplCurrent' => 'bread_tplCurrent'
		]}       
        <div class="text-center">
            <h1 class="page-title">Все МФО</h1>
        </div>
        {*<div class="search">
            <input class="search__input" type="text" placeholder="Введите название МФО">
        </div>*}
        <div class="company-table">
            <div class="company-table-wrap">
                <table class="company-all">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Название</th>
                            <th>Контакты</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        {'!pdoResources' | snippet : [
                            'parents' => $_modx->resource.id,
                			'tpl' => 'table_company',
                			'depth' => 0,
                			'includeTVs' => 'referal_link, link_to_site, img, site, phone, address, license',
                			'limit' => 0,
                            'sortby'=>'{"menuindex":"ASC"}'
                		]}
                    </tbody>
                </table>
            </div>
        </div> <!-- /.company-table -->
        {*<div class="more"><a href="#" class="btn btn-more">Все МФО<span class="btn-dop"></span></a></div>*}
    </div> <!-- ./container -->
</section>

{/block}

{block 'before_footer'}{/block}
{block 'after_footer'}
	{$_modx->runSnippet('!reload_filter')}
{/block}