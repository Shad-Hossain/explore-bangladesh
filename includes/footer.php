<?php require_once __DIR__ . '/../config/site.php'; ?>
<script src="<?= BASE_URL ?>js/weatherplanner.js?v=6"></script>
<?php echo str_replace('/explore-bangladesh-main/', BASE_URL, file_get_contents(__DIR__ . '/footer.html')); ?>
</main>
<script src="<?= BASE_URL ?>js/util.js?v=6"></script>
<script src="<?= BASE_URL ?>js/api.js?v=6"></script>
<script src="<?= BASE_URL ?>js/layout.js?v=6"></script>
<script src="<?= BASE_URL ?>js/script.js?v=6"></script>
</body>
</html>