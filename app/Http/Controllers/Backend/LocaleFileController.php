<?php
namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App;
use Lang;

class LocaleFileController extends Controller
{
    private $lang = 'en';
    private $file ;
    private $key;
    private $value;
    private $path;
    private $arrayLang = array();

//------------------------------------------------------------------------------
// Add or modify lang files content
//------------------------------------------------------------------------------

    public function changeLang(Request $request) {
        // Process and prepare you data as you like.
        $this->lang = 'en';
        $this->file = 'shop';
        $this->key = 'advertisement_category';
        $this->value = [
        'title'             => 'Advertisement Categories',
        'title_singular'    => 'Advertisement Category',
        'fields'            => [
            'name'                 => 'Name (En)',
            'name_helper'          => '',
            'name_ar'              => 'Name (Ar)',
            'name_ar_helper'       => '',
            'status'               => 'Status',
            'status_helper'        => '',
            'type'                 => 'Type',
            'type_helper'          => '',
        ],
        ];
        // END - Process and prepare your data
        
        $api=$this->changeLangFileContent();
        //$this->deleteLangFileContent();
        return view('admin/index'); 
    }

//------------------------------------------------------------------------------
// Add or modify lang files content
//------------------------------------------------------------------------------

    private function changeLangFileContent() 
    {
        $read = $this->read();
       
        $this->arrayLang[$this->key] = $this->value;
         
        $this->save();
    }

//------------------------------------------------------------------------------
// Delete from lang files
//------------------------------------------------------------------------------

    private function deleteLangFileContent() 
    {
        $this->read();
        unset($this->arrayLang[$this->key]);
        $this->save();
    }

//------------------------------------------------------------------------------
// Read lang file content
//------------------------------------------------------------------------------

    private function read() 
    {
        if ($this->lang == '') $this->lang = App::getLocale();
        $this->path = base_path().'/resources/lang/'.$this->lang.'/'.$this->file.'.php';
        $this->arrayLang = Lang::get($this->file);
        if (gettype($this->arrayLang) == 'string') $this->arrayLang = array();
    }

//------------------------------------------------------------------------------
// Save lang file content
//------------------------------------------------------------------------------

    private function save(){
        $content = "<?php\n\nreturn\n[\n";
       // var_dump($this->arrayLang);
       // die();
        foreach ($this->arrayLang as $key => $value){
            foreach ($value as $key1 => $value1) {
               $content .= "\t'".$key1."' => '".$value1."',\n";
            }
            print_r($value);
            die;

            
        }
        $content .= "];";
         echo $content;
         die();
        file_put_contents($this->path, $content);
    }
}