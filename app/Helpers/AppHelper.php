<?php

namespace App\Helpers;

class AppHelper
{
    public static function handleDiscount($price, $discount, $returnCurrency = true)
    {
        $discountPrice = $price / 100 * $discount;
        return $returnCurrency ? self::formatCurrency($price - $discountPrice) : $discountPrice;
    }

    public static function formatCurrency($num)
    {
        return number_format($num, 0,",",".");
    }

    public static function toInteger($num)
    {
        // dd($num);
        return preg_replace('/[^A-Za-z0-9\-]/', '', $num);
    }
}