<?php return array (
  'manifest-version' => '1.1',
  'manifest-attributes' => 
  array (
    'changelog' => 'Changelog for SeoFilter.

1.6.4-beta (17.03.2019)
======================
- поправлен класс sfMenu
- убраны предупреждения при установке/удалении компонента
- теперь устанавливается на MODX 3
- улучшено добавление default.js на страницу

1.6.3-beta (11.03.2019)
=======================
- добавлена поддержка одиночных значений для слайдера
- настройка seofilter_page_key теперь по умолчанию "page"
- добавлена настройка seofilter_page_tpl (шаблон для ЧПУ-пагинации, например "/[[+pageVarKey]]-[[+page]]")
- добавлена поддержка Ajax ЧПУ-пагинации в mFilter2

1.6.2-beta (01.02.2019)
=======================
- Добавлены ключи настроек во вкладку Настройки
- Поправлена работа с визуальным редактором CKEditor
- Исправление группировки по правилам для sfMenu в PRO-режиме
- Поправлена интеграция с FrontendManager

1.6.1-beta (22.01.2019)
=======================
- Обновление названия у SEO-страниц, если было пустым (при добавлении шаблона названия в правило)
- Автоматическое формирование шаблона названия, если он пуст (при добавлении полей в правило)
- Два новых условия LIKE, NOT LIKE при добавлении поля в правило
- Скрытая возможность менять url-маску в правилах (без проверок корректности)

1.6.0-beta (14.01.2019)
=======================
- Добавлено больше всплывающих описаний для полей, переименованы некоторые пункты
- Серьёзно переделан js-файл для фронтенда (старый с припиской -old)
- Возможность очень просто подгрузить контент и url под SEO-страницу из любого фильтра
- Добавлены события для плагинов при добавлении слов, ссылок и возвращению SEO-данных
- Возможность подключить визуальный редактор или Ace для любых полей в правиле/странице
- Новая вкладка Настройки для большего удобства
- Табы и гриды в админке теперь запоминают состояние
- Сортировка по активным объектам теперь по столбцу Действия
- Пошаговый пересчёт и удаление пустых страниц в SEO-страницах
- Условие для ограничения сбора значений в полях стало гораздо серьёзнее
- Вложенные хлебные крошки с автопоиском (чанк tpl.SeoFilter.crumbs.nested)
- Поддержка запросов с процентами, плюсами и амперсандами
- Возможность изменять путь класса для сниппетов
- Появились примеры заполненных полей при добавлении
- Улучшение подсчётов, исправление ошибок

1.5.4-beta (16.07.2018)
=======================
- Настройка seofilter_url_scheme по умолчанию "full";
- Новый параметр сниппета sfLink - "link_classes". Классы для ссылки;
- Слова теперь можно отключать и они не будут участвовать в формировании ссылок. Ссылки с ними - удалятся. Повторное включение создаст новые ссылки;
- Добавлен учёт настройки seofilter_admin_version, который отвечает за версионность скриптов в админке. Если версионность не нужна - добавьте настройку в ручную со значением 0;
- Поправлено формирование ссылок, адресов когда ссылки в один уровень и привязаны к главной;
- Поправлен подсчёт для слайдеров, если они на основе ТВ полей;
- Мелкие улучшения и переименования в админ-панели.

1.5.3-beta (19.06.2018)
=======================
- Небольшие изменения для подсчётов через расширение класса
- Неактивные поля теперь только для того, чтобы не собирать значения

1.5.2-beta (01.06.2018)
=======================
- Поправлен процессор вывода списка страниц
- Поправлена установка pdoTools при отсутствии на сайте

1.5.1-beta (24.05.2018)
=======================
- Поправлен сниппет sfLink для работы с Pro-режимом
- Поправлено поле editedon в mysql-схеме

1.5.0-beta (21.05.2018)
=======================
- Добавлен PRO-режим, который позволяет привязывать к правилу несколько страниц
- Интеграция с компонентом Tagger, включая подсчёты
- Добавлена возможность получать SEO-ссылки без вложенности через слеш (настройка seofilter_level_separator)
- Добавлена возможность генерации SEO-ссылок в 1 уровень от корня сайта (настройка seofilter_between_urls)
- Добавлен класс seoPage для переопределения класса pdoPage для получения более точных ссылок в пагинации
- Мелкие удобства с подсчётами:
- Локальный счётчик обновляется, если значения отличаются
- Новая настройка для подстановки условий в новые правила
- Добавлен файл для пересчёта через cron
- Новые поля по умолчанию в строгом поиске, так подсчёты гораздо точнее
- Добавлен пункт пересчёт результатов ссылок по слову и правилу в таблице через правую кнопку мыши
- Оптимизация и исправление всех предыдущих ошибок

1.4.8-beta (16.04.2018)
=======================
- Сниппет sfLink теперь принимает параметры pages, where, as_name для простоты поиска ссылок
- Поправил работу с группировкой в sfMenu, поддерживает сортировку правил, при пустом sortby сортировка согласно переданным правилам
- Сниппет sfWord вовзращает весь массив со всеми падежами для Fenom (можете использовать для склонения любых слов)
- В шаблон генерации ссылок добавлена переменная id ресурса {$id} для использования полей
- Добавлена настройка seofilter_replace_host (для тех сайтов, у которых одна страница доступна на нескольких доменах)
- Подчистил компонент от лишних записей в лог и исправил мелкие ошибки, оптимизировано под PHP 7.2

1.4.7-beta
==============
- Поправлен механизм поиска страницы в плагине для сайтов с дубликатами синонимов
- Поправлена работа с parents в sfMenu, теперь строго "page:IN" (без OR)

1.4.6-beta
==============
- Поправил ошибку в плагине при отключенных подсчётах

1.4.5-beta
==============
- Добавил забытый where для sfMenu
- Добавлена поддержка PHP 5.3

1.4.4-beta
==============
- Повышена стабильность работы
- Больше "связанных" функций
- Исправлено множество ошибок
- Добавлена зависимость полей
- Исправлены подсчёты
- Для подсчётов добавлен новый класс, который можно расширять
- Интеграция tvSuperSelect - указать компонент в Поле
- Обрабатываются замороженные адресов страниц
- Поправлено формирование ссылок
- Учитываются различный суффиксы контейнером
- Перегенерация названий ссылок при изменении слова
- Промежуточные подсчёты для ускорения меню
- Пересчёт результатов при изменениях или по кнопке
- Улучшено копирование правила
- Добавление правила за один подход
- Ajax хлебные крошки
- Добавлено поле keywords в правила и ссылки
- Передача параметра LastModified (настройка)
- Поддержка браузерной истории по кнопкам назад, вперёд
- Версионнирование js,css файлов
- Обновления в склонениях. Теперь нужен только токен.
- Интеграция с msVendorCollections
- Добавлены скрытые возможности
- Мелкие улучшения в работе


1.3.1-beta
==============
- Мелкие исправления по ТВ-полям
- Убрал забытый из меню вывод в лог
- Изменён поиск пути в action.php

1.3.0-beta
==============
- Добавлен сниппет sfMenu для формирования меню с подсчётом ресурсов
- Добавлен сниппет sfSitemap для формирования карты сайта
- Полностью переработан сниппет sfLink - гораздо быстрее и удобнее
- Поправил работу плагина с вложенностью страниц
- Добавлен новый класс для работы с меню

1.2.2-beta
==============
- Добавлена поддержка JSON полей, включая tvSuperSelect
- Изменён приоритет на событие onDocFormSave для поддержки TVSS
- Добавлена работа с любыми суффиксами контейнера (/,.html и т.д)
- Добавлена настройка для добавления своего суффикса к сгенерированным страницам
- Добавлена настройка переадресации на правильный суффикс
- Добавлена настройка с названием параметра пагинации, для передачи № страницы в СЕО тексты

1.2.1-beta
==============
- Добавлена поддержка значений из других таблиц для ТВ полей

1.2.0-beta
==============
- Добавлена работа для работы полей-слайдеров (недорогие товары и т.д)
- Устранены некоторые ошибки в js и в классе
- Автоматическая генерация названия для новых ссылок при добавлении новых слов
- Лексиконы компонента переведены на английский язык
- Убраны из класса значения по-умолчанию, чтобы не было подстановок на пустых js полях

1.1.3-beta
==============
- Добавлено копирование правил
- Шаблоны для названия ссылки и галочка перегенерировать
- Изменён механизм подсчёта потомков и выборок
- Добавление правил с учётом полей-слайдеров (цена и т.д)
- Две новые настройки для названия ссылки

1.1.2-beta
==============
- Поправлена работа с ТВ-полями

1.1.1-beta
==============
- Соседние вкладки теперь обновляются автоматически
- Мелкие фиксы

1.1.0-beta
==============
- Поправлены лексиконы
- Поправлен js-файл для обработки заголовков
- Убраны лишние комментарии
- Устанены мелкие баги и ошибки

1.0.10-beta
==============
- Добавлены условия для полей в правиле, чтобы создавать определённые страницы
- Добавил поле editedon для правила и комбобокс с выбором страницы
- Поправил подсчёт мин/макс выборок по ТВ значениям
- Мощный апгрейд кода в логике поиска правил, приоритеты для правил
- Добавлен сниппет sfLink для создания ссылки по нескольким правилам

1.0.9-beta
==============
- Новые комбобоксы в словаре, по полю и значению для более быстрого поиска нужных адресов

1.0.8-beta
==============
- Добавил столбик с датой редактирования для словаря

1.0.7-beta
==============
- Вернул добавление слова в словарь, так удобнее
- Сделал нормальную 404-ую страницу при несуществующих страницах (из админки можно проверить страницу по get-параметрам)

1.0.6-beta
==============
- Вывел для редактирования в окнах URL пункты, связанные с выводом меню

1.0.5-beta
==============
- Добавлен контроллёр для редактирования уникальных мета-тегов с фронтенда для каждой страницы
- Добавлена новый класс для связи URL с полями и словами
- Теперь после редактирования поля, слова обновляются все связанные данные

1.0.4-beta
==============
- Добавил функцию выборки минимальных и максимальных значений.
- Добавил prepareSnippet для подстановки обработанных значений в мета-теги

1.0.3-beta
==============
- Исправление ошибок
- Добавил функцию подсчёта. Активировать в настройках. В шаблонах плейсхолдер count

1.0.2-beta
==============
- Конкретно переписана логика компонента

1.0.1-beta
==============
- Добавлена работа со всеми полями

1.0.0-beta
==============
- First Release',
    'license' => 'GNU GENERAL PUBLIC LICENSE
   Version 2, June 1991
--------------------------

Copyright (C) 1989, 1991 Free Software Foundation, Inc.
59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

Everyone is permitted to copy and distribute verbatim copies
of this license document, but changing it is not allowed.

Preamble
--------

  The licenses for most software are designed to take away your
freedom to share and change it.  By contrast, the GNU General Public
License is intended to guarantee your freedom to share and change free
software--to make sure the software is free for all its users.  This
General Public License applies to most of the Free Software
Foundation\'s software and to any other program whose authors commit to
using it.  (Some other Free Software Foundation software is covered by
the GNU Library General Public License instead.)  You can apply it to
your programs, too.

  When we speak of free software, we are referring to freedom, not
price.  Our General Public Licenses are designed to make sure that you
have the freedom to distribute copies of free software (and charge for
this service if you wish), that you receive source code or can get it
if you want it, that you can change the software or use pieces of it
in new free programs; and that you know you can do these things.

  To protect your rights, we need to make restrictions that forbid
anyone to deny you these rights or to ask you to surrender the rights.
These restrictions translate to certain responsibilities for you if you
distribute copies of the software, or if you modify it.

  For example, if you distribute copies of such a program, whether
gratis or for a fee, you must give the recipients all the rights that
you have.  You must make sure that they, too, receive or can get the
source code.  And you must show them these terms so they know their
rights.

  We protect your rights with two steps: (1) copyright the software, and
(2) offer you this license which gives you legal permission to copy,
distribute and/or modify the software.

  Also, for each author\'s protection and ours, we want to make certain
that everyone understands that there is no warranty for this free
software.  If the software is modified by someone else and passed on, we
want its recipients to know that what they have is not the original, so
that any problems introduced by others will not reflect on the original
authors\' reputations.

  Finally, any free program is threatened constantly by software
patents.  We wish to avoid the danger that redistributors of a free
program will individually obtain patent licenses, in effect making the
program proprietary.  To prevent this, we have made it clear that any
patent must be licensed for everyone\'s free use or not licensed at all.

  The precise terms and conditions for copying, distribution and
modification follow.


GNU GENERAL PUBLIC LICENSE
TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
---------------------------------------------------------------

  0. This License applies to any program or other work which contains
a notice placed by the copyright holder saying it may be distributed
under the terms of this General Public License.  The "Program", below,
refers to any such program or work, and a "work based on the Program"
means either the Program or any derivative work under copyright law:
that is to say, a work containing the Program or a portion of it,
either verbatim or with modifications and/or translated into another
language.  (Hereinafter, translation is included without limitation in
the term "modification".)  Each licensee is addressed as "you".

Activities other than copying, distribution and modification are not
covered by this License; they are outside its scope.  The act of
running the Program is not restricted, and the output from the Program
is covered only if its contents constitute a work based on the
Program (independent of having been made by running the Program).
Whether that is true depends on what the Program does.

  1. You may copy and distribute verbatim copies of the Program\'s
source code as you receive it, in any medium, provided that you
conspicuously and appropriately publish on each copy an appropriate
copyright notice and disclaimer of warranty; keep intact all the
notices that refer to this License and to the absence of any warranty;
and give any other recipients of the Program a copy of this License
along with the Program.

You may charge a fee for the physical act of transferring a copy, and
you may at your option offer warranty protection in exchange for a fee.

  2. You may modify your copy or copies of the Program or any portion
of it, thus forming a work based on the Program, and copy and
distribute such modifications or work under the terms of Section 1
above, provided that you also meet all of these conditions:

    a) You must cause the modified files to carry prominent notices
    stating that you changed the files and the date of any change.

    b) You must cause any work that you distribute or publish, that in
    whole or in part contains or is derived from the Program or any
    part thereof, to be licensed as a whole at no charge to all third
    parties under the terms of this License.

    c) If the modified program normally reads commands interactively
    when run, you must cause it, when started running for such
    interactive use in the most ordinary way, to print or display an
    announcement including an appropriate copyright notice and a
    notice that there is no warranty (or else, saying that you provide
    a warranty) and that users may redistribute the program under
    these conditions, and telling the user how to view a copy of this
    License.  (Exception: if the Program itself is interactive but
    does not normally print such an announcement, your work based on
    the Program is not required to print an announcement.)

These requirements apply to the modified work as a whole.  If
identifiable sections of that work are not derived from the Program,
and can be reasonably considered independent and separate works in
themselves, then this License, and its terms, do not apply to those
sections when you distribute them as separate works.  But when you
distribute the same sections as part of a whole which is a work based
on the Program, the distribution of the whole must be on the terms of
this License, whose permissions for other licensees extend to the
entire whole, and thus to each and every part regardless of who wrote it.

Thus, it is not the intent of this section to claim rights or contest
your rights to work written entirely by you; rather, the intent is to
exercise the right to control the distribution of derivative or
collective works based on the Program.

In addition, mere aggregation of another work not based on the Program
with the Program (or with a work based on the Program) on a volume of
a storage or distribution medium does not bring the other work under
the scope of this License.

  3. You may copy and distribute the Program (or a work based on it,
under Section 2) in object code or executable form under the terms of
Sections 1 and 2 above provided that you also do one of the following:

    a) Accompany it with the complete corresponding machine-readable
    source code, which must be distributed under the terms of Sections
    1 and 2 above on a medium customarily used for software interchange; or,

    b) Accompany it with a written offer, valid for at least three
    years, to give any third party, for a charge no more than your
    cost of physically performing source distribution, a complete
    machine-readable copy of the corresponding source code, to be
    distributed under the terms of Sections 1 and 2 above on a medium
    customarily used for software interchange; or,

    c) Accompany it with the information you received as to the offer
    to distribute corresponding source code.  (This alternative is
    allowed only for noncommercial distribution and only if you
    received the program in object code or executable form with such
    an offer, in accord with Subsection b above.)

The source code for a work means the preferred form of the work for
making modifications to it.  For an executable work, complete source
code means all the source code for all modules it contains, plus any
associated interface definition files, plus the scripts used to
control compilation and installation of the executable.  However, as a
special exception, the source code distributed need not include
anything that is normally distributed (in either source or binary
form) with the major components (compiler, kernel, and so on) of the
operating system on which the executable runs, unless that component
itself accompanies the executable.

If distribution of executable or object code is made by offering
access to copy from a designated place, then offering equivalent
access to copy the source code from the same place counts as
distribution of the source code, even though third parties are not
compelled to copy the source along with the object code.

  4. You may not copy, modify, sublicense, or distribute the Program
except as expressly provided under this License.  Any attempt
otherwise to copy, modify, sublicense or distribute the Program is
void, and will automatically terminate your rights under this License.
However, parties who have received copies, or rights, from you under
this License will not have their licenses terminated so long as such
parties remain in full compliance.

  5. You are not required to accept this License, since you have not
signed it.  However, nothing else grants you permission to modify or
distribute the Program or its derivative works.  These actions are
prohibited by law if you do not accept this License.  Therefore, by
modifying or distributing the Program (or any work based on the
Program), you indicate your acceptance of this License to do so, and
all its terms and conditions for copying, distributing or modifying
the Program or works based on it.

  6. Each time you redistribute the Program (or any work based on the
Program), the recipient automatically receives a license from the
original licensor to copy, distribute or modify the Program subject to
these terms and conditions.  You may not impose any further
restrictions on the recipients\' exercise of the rights granted herein.
You are not responsible for enforcing compliance by third parties to
this License.

  7. If, as a consequence of a court judgment or allegation of patent
infringement or for any other reason (not limited to patent issues),
conditions are imposed on you (whether by court order, agreement or
otherwise) that contradict the conditions of this License, they do not
excuse you from the conditions of this License.  If you cannot
distribute so as to satisfy simultaneously your obligations under this
License and any other pertinent obligations, then as a consequence you
may not distribute the Program at all.  For example, if a patent
license would not permit royalty-free redistribution of the Program by
all those who receive copies directly or indirectly through you, then
the only way you could satisfy both it and this License would be to
refrain entirely from distribution of the Program.

If any portion of this section is held invalid or unenforceable under
any particular circumstance, the balance of the section is intended to
apply and the section as a whole is intended to apply in other
circumstances.

It is not the purpose of this section to induce you to infringe any
patents or other property right claims or to contest validity of any
such claims; this section has the sole purpose of protecting the
integrity of the free software distribution system, which is
implemented by public license practices.  Many people have made
generous contributions to the wide range of software distributed
through that system in reliance on consistent application of that
system; it is up to the author/donor to decide if he or she is willing
to distribute software through any other system and a licensee cannot
impose that choice.

This section is intended to make thoroughly clear what is believed to
be a consequence of the rest of this License.

  8. If the distribution and/or use of the Program is restricted in
certain countries either by patents or by copyrighted interfaces, the
original copyright holder who places the Program under this License
may add an explicit geographical distribution limitation excluding
those countries, so that distribution is permitted only in or among
countries not thus excluded.  In such case, this License incorporates
the limitation as if written in the body of this License.

  9. The Free Software Foundation may publish revised and/or new versions
of the General Public License from time to time.  Such new versions will
be similar in spirit to the present version, but may differ in detail to
address new problems or concerns.

Each version is given a distinguishing version number.  If the Program
specifies a version number of this License which applies to it and "any
later version", you have the option of following the terms and conditions
either of that version or of any later version published by the Free
Software Foundation.  If the Program does not specify a version number of
this License, you may choose any version ever published by the Free Software
Foundation.

  10. If you wish to incorporate parts of the Program into other free
programs whose distribution conditions are different, write to the author
to ask for permission.  For software which is copyrighted by the Free
Software Foundation, write to the Free Software Foundation; we sometimes
make exceptions for this.  Our decision will be guided by the two goals
of preserving the free status of all derivatives of our free software and
of promoting the sharing and reuse of software generally.

NO WARRANTY
-----------

  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
REPAIR OR CORRECTION.

  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
POSSIBILITY OF SUCH DAMAGES.

---------------------------
END OF TERMS AND CONDITIONS',
    'readme' => '--------------------
SeoFilter - convenient control of friendly URL, meta tags and text generation
--------------------
Author: Evgeniy Sheronov <webrush@bk.ru>
--------------------

SeoFilter for Minishop2 & mSearch2 and not only for MODX Revolution.

The articles about SeoFilter:
https://modx.pro/components/12921/
https://modx.pro/components/13407/
https://modx.pro/components/14899/
https://modx.pro/components/15476/
https://modx.pro/components/17313/

Full Documentation: https://docs.modx.pro/komponentyi/seofilter
Demo: http://s9767.h8.modhost.pro

Possible additional paid modifications for a specific project.',
    'chunks' => 
    array (
      'tpl.SeoFilter.crumbs.current' => '{if !$sflink}{set $sflink = $_modx->getPlaceholder(\'sf.link\')}{/if}
{if !$sfurl}{set $sfurl = $_modx->getPlaceholder(\'sf.url\')}{/if}
<li class="sf_crumb{if !$sflink} active{/if}" data-idx="{$idx}" data-separator="{$outputSeparator|htmlentities}">
    {if $sflink}
        <a href="{$link}">{$menutitle}</a>
    {else}
        {$menutitle}
    {/if}
</li>{if $sflink}{$outputSeparator}<li class="active sf_crumbs" data-idx="{++$idx}">
<span class="sf_link">{$sflink}</span>
    {*закомментированный ниже вариант позволит возвращать ссылку *}
    {*{set $page_link = $link}
    {foreach [\'.html\',\'.php\'] as $suffix}
        {set $msufx = \'*\'~$suffix}
        {if $page_link | match : $msufx}
            {set $r_mask = \'/\'~$suffix~\'$/\'}
            {set $page_link = ($page_link | ereplace: $r_mask:\'/\')}
            {break}
        {/if}
    {/foreach}
    <a href="{$page_link}{$sfurl}" class="sf_link">{$sflink}</a>
    *}
</li>
{/if}
',
      'tpl.SeoFilter.crumbs.nested' => '{if !$sfnested}{set $sfnested = $_modx->getPlaceholder(\'sf.nested\')|fromJSON}{/if}
{if !$sflink}{set $sflink = $_modx->getPlaceholder(\'sf.link\')}{/if}
{if !$sfurl}{set $sfurl = $_modx->getPlaceholder(\'sf.url\')}{/if}
{if !$idx}{set $idx = 1}{/if}
{set $page_link = $link}
{foreach [\'.html\',\'.php\'] as $suffix}
    {set $msufx = \'*\'~$suffix}
    {if $page_link | match : $msufx}
        {set $r_mask = \'/\'~$suffix~\'$/\'}
        {set $page_link = ($page_link | ereplace: $r_mask:\'/\')}
        {break}
    {/if}
{/foreach}
<li class="sf_crumb{if !$sflink} active{/if}" data-idx="{$idx++}" data-separator="{$outputSeparator|htmlentities}">{if $sflink}<a href="{$link}">{$menutitle}</a>{else}{$menutitle}{/if}
</li>{if $sfnested?}{foreach $sfnested as $inner_link}{$outputSeparator}<li class="sf_crumb_nested" data-idx="{$idx++}"><a href="{$page_link}{$inner_link[\'sfurl\']}">{$inner_link[\'sflink\']}</a>
</li>{/foreach}{/if}{if $sflink}{$outputSeparator}<li class="active sf_crumbs" data-idx="{$idx++}"><span class="sf_link">{$sflink}</span>
    {*закомментированный ниже вариант позволит возвращать ссылку *}
    {*<a href="{$page_link}{$sfurl}" class="sf_link">{$sflink}</a>*}
</li>{/if}
',
    ),
    'setup-options' => 'seofilter-1.6.4-beta/setup-options.php',
  ),
  'manifest-vehicles' => 
  array (
    0 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modNamespace',
      'guid' => '5f23efa684e224f7d3fd475530d76c95',
      'native_key' => 'seofilter',
      'filename' => 'modNamespace/9d4d4ca5b1aef59d1a459c37fe66b4ca.vehicle',
      'namespace' => 'seofilter',
    ),
    1 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOFileVehicle',
      'class' => 'xPDOFileVehicle',
      'guid' => '2f0ea8494eecb73053ff522d925ba22a',
      'native_key' => '2f0ea8494eecb73053ff522d925ba22a',
      'filename' => 'xPDOFileVehicle/7568ac129082a8fadbfbc324bf0e5fbf.vehicle',
    ),
    2 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '385dca8ef9ab1cb730b8e9f037f87c3c',
      'native_key' => 'seofilter_separator',
      'filename' => 'modSystemSetting/8d26479cb6da25bc03071566496557f5.vehicle',
      'namespace' => 'seofilter',
    ),
    3 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'a28dbac4b58d693890a776ed26a388c8',
      'native_key' => 'seofilter_base_get',
      'filename' => 'modSystemSetting/6f5a84f4a79363ca1d19d4fee8ecdeed.vehicle',
      'namespace' => 'seofilter',
    ),
    4 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '661ac9672cda4001aca7699278d481c8',
      'native_key' => 'seofilter_ajax',
      'filename' => 'modSystemSetting/f7d04e2d07d7434f0b349fb49113fb22.vehicle',
      'namespace' => 'seofilter',
    ),
    5 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '90749fb851da3042b70dc10280eb2856',
      'native_key' => 'seofilter_decline',
      'filename' => 'modSystemSetting/deefd3be042264454fa8d7ccc3a7a172.vehicle',
      'namespace' => 'seofilter',
    ),
    6 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '8682ddfa6a0edb89c069c513d4ebf971',
      'native_key' => 'seofilter_morpher_token',
      'filename' => 'modSystemSetting/e15e1874a77f9717f16e08fb41a3cb41.vehicle',
      'namespace' => 'seofilter',
    ),
    7 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '1f3a3b13cd89666ec406fd352242b27f',
      'native_key' => 'seofilter_classes',
      'filename' => 'modSystemSetting/fb9fcddbf2f6e75a1cd0f268699928f2.vehicle',
      'namespace' => 'seofilter',
    ),
    8 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '4b3ee585349e0e054ec423bead32b1bd',
      'native_key' => 'seofilter_templates',
      'filename' => 'modSystemSetting/5543b5f39260316533b86794c8111e85.vehicle',
      'namespace' => 'seofilter',
    ),
    9 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '34fbe9ec682a72a88a46c0934759e03e',
      'native_key' => 'seofilter_page_key',
      'filename' => 'modSystemSetting/cf75e171a5eb1bf6100683a125594fa9.vehicle',
      'namespace' => 'seofilter',
    ),
    10 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '7538aaa724affc6275263227d3912186',
      'native_key' => 'seofilter_page_tpl',
      'filename' => 'modSystemSetting/43189ad2382195bf2467051032662e94.vehicle',
      'namespace' => 'seofilter',
    ),
    11 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '1b2fe93fae58cdfb782cb9b0468c7bfc',
      'native_key' => 'seofilter_url_suffix',
      'filename' => 'modSystemSetting/320e006fd7c7e2ab8029b1e5882da00f.vehicle',
      'namespace' => 'seofilter',
    ),
    12 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'fa4dbb09b3ba9744cb4eeac709191604',
      'native_key' => 'seofilter_url_redirect',
      'filename' => 'modSystemSetting/e20da6afe7c6c2f6421294664cacb1a9.vehicle',
      'namespace' => 'seofilter',
    ),
    13 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '78bb44b392fc5254254d4f5192d1ed43',
      'native_key' => 'seofilter_last_modified',
      'filename' => 'modSystemSetting/8a3891b4e8442fc53d1fa3a6b154f143.vehicle',
      'namespace' => 'seofilter',
    ),
    14 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '8c5cef5d090103f298e91a2da8abf12e',
      'native_key' => 'seofilter_mfilter_words',
      'filename' => 'modSystemSetting/7ba1c6ffbe92fce2162849b3156dc607.vehicle',
      'namespace' => 'seofilter',
    ),
    15 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '5314bd434f8c0b5b19698fbdada036fb',
      'native_key' => 'seofilter_values_separator',
      'filename' => 'modSystemSetting/bb49f8d22476a2f58085411cf711b7ee.vehicle',
      'namespace' => 'seofilter',
    ),
    16 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '5b140078d409c6f5af053fc4ac28ebdf',
      'native_key' => 'seofilter_values_delimeter',
      'filename' => 'modSystemSetting/4c54a2770da1eeb77cd73966bb694db1.vehicle',
      'namespace' => 'seofilter',
    ),
    17 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'fb7e7d2445590cbb877781d666a5ddbc',
      'native_key' => 'seofilter_snippet',
      'filename' => 'modSystemSetting/6bfab97044a0cdf91065b0797f233279.vehicle',
      'namespace' => 'seofilter',
    ),
    18 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'a85678b6d8fa6cf540edfb1c8464f4bb',
      'native_key' => 'seofilter_replace_host',
      'filename' => 'modSystemSetting/481bc285bc083c1c4a9da703b56dbaf7.vehicle',
      'namespace' => 'seofilter',
    ),
    19 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '65750f14d397420c469db3a02e481814',
      'native_key' => 'seofilter_pro_mode',
      'filename' => 'modSystemSetting/ed4d7f4407511132ceaafeba61311ecd.vehicle',
      'namespace' => 'seofilter',
    ),
    20 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'ed26089fae3a5bbe5f1313618f1ed17b',
      'native_key' => 'seofilter_url_scheme',
      'filename' => 'modSystemSetting/3e8c23c84a02fcd2d2eee7e6da5dce59.vehicle',
      'namespace' => 'seofilter',
    ),
    21 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '3519abc74092b8c251fc71da2abc713f',
      'native_key' => 'seofilter_level_separator',
      'filename' => 'modSystemSetting/47dab1c30c259bdba7d905e74eba4b33.vehicle',
      'namespace' => 'seofilter',
    ),
    22 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '6bf8194e7caec8c2eaa84ae58311f92e',
      'native_key' => 'seofilter_between_urls',
      'filename' => 'modSystemSetting/8bd7fb7a7a96cc3b1ec26b9bb4a46c9a.vehicle',
      'namespace' => 'seofilter',
    ),
    23 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '29ed3f4ebdc0c6987457a24b45487266',
      'native_key' => 'seofilter_main_alias',
      'filename' => 'modSystemSetting/5bad9f5c94ba2a16d2f7049624750e95.vehicle',
      'namespace' => 'seofilter',
    ),
    24 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'bb698e1ae69e3485e56164d79d2129b7',
      'native_key' => 'seofilter_admin_version',
      'filename' => 'modSystemSetting/2ca829626a9a0c94c11286df4f6c516d.vehicle',
      'namespace' => 'seofilter',
    ),
    25 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '364f234b6f5a7ca3afc712d9e0704970',
      'native_key' => 'seofilter_collect_words',
      'filename' => 'modSystemSetting/948def5b30d6f3936c2880f57d837dc0.vehicle',
      'namespace' => 'seofilter',
    ),
    26 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '7e80db2e30ebf4d7a148b7a9306b6ee6',
      'native_key' => 'seofilter_content_richtext',
      'filename' => 'modSystemSetting/e03bf6cefc2c6b8b51cab773a068c575.vehicle',
      'namespace' => 'seofilter',
    ),
    27 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'd692f0a5db299808dfdca28a26100aed',
      'native_key' => 'seofilter_content_ace',
      'filename' => 'modSystemSetting/d3012eb87301e7f49fdab90bca640c55.vehicle',
      'namespace' => 'seofilter',
    ),
    28 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '642d70f19141380396e46172d3c33841',
      'native_key' => 'seofilter_frontend_js',
      'filename' => 'modSystemSetting/448dfcc193171df964faf7e51d0d61ad.vehicle',
      'namespace' => 'seofilter',
    ),
    29 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '3b1646bc396b944fd41e74ab1fbdcbe4',
      'native_key' => 'seofilter_hide_empty',
      'filename' => 'modSystemSetting/039bbbe3eba705bd129dc3071fda72bb.vehicle',
      'namespace' => 'seofilter',
    ),
    30 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '0d7ade74a05aaf2b14d2921ab02ca8b3',
      'native_key' => 'seofilter_count',
      'filename' => 'modSystemSetting/c3e67dba6d64bad27c1bdde26ca83775.vehicle',
      'namespace' => 'seofilter',
    ),
    31 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'c752cf6a4a6053a39e03b8ede785371a',
      'native_key' => 'seofilter_choose',
      'filename' => 'modSystemSetting/c4049c3870221d0550cc9668d6c3aaed.vehicle',
      'namespace' => 'seofilter',
    ),
    32 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '130d1879508a67744d43047c8794ace8',
      'native_key' => 'seofilter_count_handler_class',
      'filename' => 'modSystemSetting/faebdcb9e409ab6969dd3b9fb4ed86c1.vehicle',
      'namespace' => 'seofilter',
    ),
    33 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'f0ee556044e25c98cc3af1509b381876',
      'native_key' => 'seofilter_select',
      'filename' => 'modSystemSetting/2f0441fd09b2e693d3ed1171cc0f66fa.vehicle',
      'namespace' => 'seofilter',
    ),
    34 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'a4b15af488c17331078f5b25f672ba06',
      'native_key' => 'seofilter_default_where',
      'filename' => 'modSystemSetting/e442a0f6ac4706c2ba831f66856aef11.vehicle',
      'namespace' => 'seofilter',
    ),
    35 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'f3324424bda6f33327c4ce057676963c',
      'native_key' => 'seofilter_title',
      'filename' => 'modSystemSetting/f70bc79b79c703052bcaf27fe0a7abce.vehicle',
      'namespace' => 'seofilter',
    ),
    36 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '069b18f4abfaa9a94b682b8dc01663dc',
      'native_key' => 'seofilter_description',
      'filename' => 'modSystemSetting/2b868ee21d08744fe790cb6e5b8666ed.vehicle',
      'namespace' => 'seofilter',
    ),
    37 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '824cb0cb2c21d6d860e48429604eab52',
      'native_key' => 'seofilter_introtext',
      'filename' => 'modSystemSetting/d0f2b75cae11d381c3cae2f21ad508b2.vehicle',
      'namespace' => 'seofilter',
    ),
    38 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '0a467e77bb4250edeb8933a84a70a66f',
      'native_key' => 'seofilter_keywords',
      'filename' => 'modSystemSetting/66c0deef8b091c537612193d254ecb19.vehicle',
      'namespace' => 'seofilter',
    ),
    39 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'fd9cb75c06267c02789415c0fc5e86f0',
      'native_key' => 'seofilter_link',
      'filename' => 'modSystemSetting/fb2eab35ed4a32115b4fa11dc085a909.vehicle',
      'namespace' => 'seofilter',
    ),
    40 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '8cb7e390dd0552ed943eb86110d6942d',
      'native_key' => 'seofilter_h1',
      'filename' => 'modSystemSetting/5cb29a5c2e9a7ec38a22697c192559db.vehicle',
      'namespace' => 'seofilter',
    ),
    41 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'a834e4e8d4e2feb09bf098debec53780',
      'native_key' => 'seofilter_h2',
      'filename' => 'modSystemSetting/4d12c71da0e6199c6602cb95735c96b7.vehicle',
      'namespace' => 'seofilter',
    ),
    42 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '78d5939d785eb5b69c2765942251cce5',
      'native_key' => 'seofilter_text',
      'filename' => 'modSystemSetting/2f85c7418d85a713b9c336b5775e5a4e.vehicle',
      'namespace' => 'seofilter',
    ),
    43 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '18d5c35b2b42393972b615d9d1e401e2',
      'native_key' => 'seofilter_content',
      'filename' => 'modSystemSetting/f5bade08a4f350630f9fdddef704d394.vehicle',
      'namespace' => 'seofilter',
    ),
    44 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '559dda25a7793b4e59046fd941e94022',
      'native_key' => 'seofilter_crumbs_tpl_current',
      'filename' => 'modSystemSetting/6d589bbfc9295715afd23830b30f966c.vehicle',
      'namespace' => 'seofilter',
    ),
    45 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '067f2d10b224156b57c17e6396e94226',
      'native_key' => 'seofilter_replacebefore',
      'filename' => 'modSystemSetting/b5a258a135537dfc59a6e199fc4614df.vehicle',
      'namespace' => 'seofilter',
    ),
    46 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '59378d292cf452604dda592423af47d8',
      'native_key' => 'seofilter_replaceseparator',
      'filename' => 'modSystemSetting/cd7a1773f8248ddfc764ee4adf7bae7f.vehicle',
      'namespace' => 'seofilter',
    ),
    47 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '5b5b4077d2f600b24742fdd8e4ba5a11',
      'native_key' => 'seofilter_jtitle',
      'filename' => 'modSystemSetting/2c4805799f28e81d933f4204e3d27740.vehicle',
      'namespace' => 'seofilter',
    ),
    48 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'a66e7b1c18927c76055c588b2a641f35',
      'native_key' => 'seofilter_jdescription',
      'filename' => 'modSystemSetting/d7eb06eb8c5129ef2daa934dd0836b9c.vehicle',
      'namespace' => 'seofilter',
    ),
    49 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '36443a461dacbb45d0d01ea083e3498e',
      'native_key' => 'seofilter_jintrotext',
      'filename' => 'modSystemSetting/d3788a3efce281743a7db09db9acdad6.vehicle',
      'namespace' => 'seofilter',
    ),
    50 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '83fe92f52083610dbabcfe81171bc99c',
      'native_key' => 'seofilter_jkeywords',
      'filename' => 'modSystemSetting/6e888d31b9eca30c3a81d44985894404.vehicle',
      'namespace' => 'seofilter',
    ),
    51 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '887184efe5266079d9b3388eb4edf7b3',
      'native_key' => 'seofilter_jlink',
      'filename' => 'modSystemSetting/e8be1875e400915c5d99449c342c2dcd.vehicle',
      'namespace' => 'seofilter',
    ),
    52 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '3e71012ff7835ac0fc0ddb7d7f5d3d6e',
      'native_key' => 'seofilter_jh1',
      'filename' => 'modSystemSetting/38fb144aea42366a153f53e8dd73bd1b.vehicle',
      'namespace' => 'seofilter',
    ),
    53 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '5a9cf814bd2635f7e4019dc731632b02',
      'native_key' => 'seofilter_jh2',
      'filename' => 'modSystemSetting/49f961dad8dada0532647ca32f27a2a1.vehicle',
      'namespace' => 'seofilter',
    ),
    54 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '517a4bf76a673fe6b168ee4d6d8c8b80',
      'native_key' => 'seofilter_jtext',
      'filename' => 'modSystemSetting/958560589d88000ae54e56e32cf60f56.vehicle',
      'namespace' => 'seofilter',
    ),
    55 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '79d4f4105c8102cb2981a6ec2b4809d7',
      'native_key' => 'seofilter_jcontent',
      'filename' => 'modSystemSetting/105d299eccea54383258388bf50eb192.vehicle',
      'namespace' => 'seofilter',
    ),
    56 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '299c2d2f9b41cc64b749a90eea1ca3a7',
      'native_key' => 'seofilter_crumbs_replace',
      'filename' => 'modSystemSetting/2d21cd8194388b8d7982adab0731f7f9.vehicle',
      'namespace' => 'seofilter',
    ),
    57 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'b2458f3466030eda352160cd1bd7f0e1',
      'native_key' => 'seofilter_crumbs_nested',
      'filename' => 'modSystemSetting/03d64c98babf2b33431e45a0dc3223bb.vehicle',
      'namespace' => 'seofilter',
    ),
    58 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modEvent',
      'guid' => '3452dd6b7645d494d6cc15273c01afeb',
      'native_key' => 'sfOnBeforeWordAdd',
      'filename' => 'modEvent/05555aae2e6340eea1d38f965c54e27b.vehicle',
      'namespace' => 'seofilter',
    ),
    59 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modEvent',
      'guid' => '2fb97469b99f92a8e749c37ed0ddc7bf',
      'native_key' => 'sfOnWordAdd',
      'filename' => 'modEvent/84441cb76fa11c805fbdb2a48c0a098c.vehicle',
      'namespace' => 'seofilter',
    ),
    60 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modEvent',
      'guid' => '650be241bd29c372840dab220512590f',
      'native_key' => 'sfOnBeforeUrlAdd',
      'filename' => 'modEvent/2e02dc1eeb7ebf6f6c5b551c4ef53c5d.vehicle',
      'namespace' => 'seofilter',
    ),
    61 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modEvent',
      'guid' => '3a4b80088a38082f592357e1249014fa',
      'native_key' => 'sfOnUrlAdd',
      'filename' => 'modEvent/4d75382530eb2e404ae87c49697224a5.vehicle',
      'namespace' => 'seofilter',
    ),
    62 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modEvent',
      'guid' => '3b3f53040239cceb06ed78ffaf81d47e',
      'native_key' => 'sfOnReturnMeta',
      'filename' => 'modEvent/0aa85d6a6e7313f9b5b1e5cab7ee8cb5.vehicle',
      'namespace' => 'seofilter',
    ),
    63 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modMenu',
      'guid' => 'c4c00152a2fa24302de0461fe664d5ab',
      'native_key' => 'seofilter',
      'filename' => 'modMenu/29cf6b47cd57a1326dc896dffa46210f.vehicle',
      'namespace' => 'seofilter',
    ),
    64 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'encryptedVehicle',
      'class' => 'modCategory',
      'guid' => '605a9510fc87b519188514071a03c324',
      'native_key' => NULL,
      'filename' => 'modCategory/80a6c09493e0a293d25dbf125bf88147.vehicle',
      'namespace' => 'seofilter',
    ),
    65 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOScriptVehicle',
      'class' => 'xPDOScriptVehicle',
      'guid' => 'da4fb2e50453dc6b527667f61c4fb053',
      'native_key' => 'da4fb2e50453dc6b527667f61c4fb053',
      'filename' => 'xPDOScriptVehicle/b90b50a18c330a665939f3e0bd27fc16.vehicle',
      'namespace' => 'seofilter',
    ),
  ),
);