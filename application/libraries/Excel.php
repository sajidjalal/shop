<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Excel
{

    /**
     * @param       $file_path
     * @param array $config     [
     *                          'getOnlySheetNames'    => false,              // Get only worksheet names as a array
     *                          'setFirstRecordAsKeys' => true,               // Set column keys as a index of each element
     *                          'getOnlySheet'         => 'SalesOrders',      // Get data of particular worksheet
     *                          ];
     */

    /**
     * @param       $sheet_data
     * @param array $config     [
     *                          'filename'    => 'Custom Name',              // prove any custom name here
     *                          'use_sheet_name_as_key' => true,               // this will consider every first index from an associative array as main headings to the table
     *                          'use_first_index'         => true,      // if true then it will set every key as sheet name for appropriate sheet
     *                          ];
     */

    public static function coordinates($x, $y)
    {
        return PHPExcel_Cell::stringFromColumnIndex($x) . $y;
    }
    public static function export($data, $config = [])
    {
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        if (count($data) == 0) {

            // set data in first row i.e header
            $sheet->setCellValueByColumnAndRow(0 + 1, 1, "Nothing to show");
            $writer = new Xlsx($spreadsheet);
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment; filename="' . urlencode($config['filename'] . date("d-m-Y") . '.xls') . '"');
            $writer->save('php://output');
        } else {

            $styleArray = [
                'font' => [
                    'bold' => true,
                ],
                // 'alignment' => [
                //     'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_RIGHT,
                // ],
                // 'borders' => [
                //     'top' => [
                //         'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                //     ],
                // ],
                // 'fill' => [
                //     'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_GRADIENT_LINEAR,
                //     'rotation' => 90,
                //     'startColor' => [
                //         'argb' => 'FFA0A0A0',
                //     ],
                //     'endColor' => [
                //         'argb' => 'FFFFFFFF',
                //     ],
                // ],
            ];

            // $spreadsheet->getActiveSheet()->getStyle('T1')->getNumberFormat()
            // ->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_NUMBER_COMMA_SEPARATED1);
            // ->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_NUMBER_00);

            $spreadsheet->getActiveSheet()->getStyle('A1:Z1')->applyFromArray($styleArray);
            // set data in first row i.e header
            $i = 1;
            foreach ($data[0] as $key => $value) {
                $sheet
                    ->getCellByColumnAndRow($i, 1)
                    ->setValueExplicit(ucwords(str_replace("_", " ", $key)), \PhpOffice\PhpSpreadsheet\Cell\DataType::TYPE_STRING);
                // $sheet->setCellValueByColumnAndRow($i, 1, $key);
                // $sheet->setCellValueByColumnAndRow(0 + 1, 1, "Nothing to show");
                $i++;
            }

            // for puttinh data in excel
            for ($i = 0, $l = sizeof($data); $i < $l; $i++) { // row $i
                $j = 0;
                foreach ($data[$i] as $k => $v) {
                    $sheet
                        ->getCellByColumnAndRow($j + 1, ($i + 1 + 1))
                        ->setValueExplicit($v, \PhpOffice\PhpSpreadsheet\Cell\DataType::TYPE_STRING); // column $j
                    // $sheet->setCellValueByColumnAndRow($j + 1, ($i + 1 + 1), $v);
                    $j++;
                }
            }

            $writer = new Xlsx($spreadsheet);
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment; filename="' . urlencode($config['filename'] . date("d-m-Y") . '.xls') . '"');
            $writer->save('php://output');
        }
    }

    public static function _getNameFromNumber($num)
    {
        $numeric = $num % 26;
        $letter = chr(65 + $numeric);
        $num2 = intval($num / 26);
        if ($num2 > 0) {
            return self::_getNameFromNumber($num2 - 1) . $letter;
        } else {
            return $letter;
        }
    }
}
