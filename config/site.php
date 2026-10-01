<?php
/**
 * App-level base URL (auto-detected).
 *
 * Works out the folder (or "/") this app is served from, so links, redirects,
 * asset URLs and API calls keep working no matter what the local folder is
 * named (e.g. htdocs/explore-bangladesh-main, htdocs/explore-bangladesh,
 * htdocs/X, or the document root itself).
 *
 * BASE_URL always ends with "/" and is absolute:
 *   "/explore-bangladesh-main/"  or  "/"
 */
if (!defined('BASE_URL')) {
    $__doc = isset($_SERVER['DOCUMENT_ROOT']) ? realpath($_SERVER['DOCUMENT_ROOT']) : false;
    $__app = str_replace('\\', '/', dirname(__DIR__));
    $__base = '';
    if ($__doc) {
        $__doc = str_replace('\\', '/', $__doc);
        if (stripos($__app, $__doc) === 0) {
            $__base = substr($__app, strlen($__doc));
        }
    }
    define('BASE_URL', rtrim($__base, '/') . '/');
}