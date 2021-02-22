<?php
class customTvssComboGetMs2OptionsProcessor extends modObjectProcessor
{
    public $classKey = 'ulLocation';
    public $objectType = 'ulLocation';
    /** @var miniShop2 $ms2 */
    protected $ulLocation;
    /** @var tvSuperSelect $tvss */
    protected $tvss;
    protected $query;
    protected $isActiveField;

    /**
     * @return bool
     */
    public function initialize()
    {
        
        /** @var UserLocation $UserLocation */
        if ($UserLocation = $this->modx->getService('userlocation.UserLocation', '', MODX_CORE_PATH.'components/userlocation/model/')) {
            $this->isActiveField = in_array('active', $UserLocation->getGridLocationFields());
        }
        $this->tvss = $this->modx->getService('tvsuperselect', 'tvSuperSelect',
            $this->modx->getOption('tvsuperselect_core_path', null, MODX_CORE_PATH . 'components/tvsuperselect/') . 'model/tvsuperselect/');

        return parent::initialize();
    }

    /**
     * @return string
     */
    public function process()
    {
        $query = trim($this->getProperty('query'));
        $limit = (int)$this->getProperty('limit', 100);
        // $resource_id = (int)$this->getProperty('resource_id', 0);
        // if (!$tv_id = (int)$this->getProperty('tv_id', 0)) {
        //     //
        // }
        $q = $this->modx->newQuery($this->classKey);
        $q->select(array(
            "{$this->classKey}.id as `id`",
            "{$this->classKey}.name as `name`",
        ));
        if (!empty($query)) {
            $q->where(array(
                "{$this->classKey}.id:LIKE" => "%{$query}%",
                "OR:{$this->classKey}.name:LIKE" => "%{$query}%"
            ));
        }
        $q->limit($limit);
        $q->sortby($this->classKey . '.name', 'ASC');
        
        $rows = array();
        if ($q->prepare() && $q->stmt->execute()) {
            if ($tmp = $q->stmt->fetchAll(PDO::FETCH_ASSOC)) {
                foreach ($tmp as $v) {
                    $rows[] = array(
                        'display' => '(' . $v['id'] . ') <b>' . $v['name'] . '</b>',
                        'value' => $v['name'],
                    );
                }
            }
        }
        foreach ($rows as &$row) {
            if (empty($row['display'])) {
                $row['display'] = $row['name'];
            }
        }
        unset($row);

        return $this->outputArray($rows);
    }
}

return 'customTvssComboGetMs2OptionsProcessor';