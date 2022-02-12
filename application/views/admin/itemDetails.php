<div class="page-content">
    <div class="container-fluid">

        <!-- start page title -->
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                    <h4 class="mb-sm-0 font-size-18">Item Details</h4>

                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="/admin/cust-list">Item</a></li>
                            <li class="breadcrumb-item active">Item Details </li>
                        </ol>
                    </div>

                </div>
            </div>
        </div>
        <!-- end page title -->

        <!-- ItemDetails Start -->
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex">
                            <div class="flex-shrink-0 me-4">
                                <img src="https://thumbs.dreamstime.com/b/url-icon-website-design-desktop-envelopment-development-premium-pack-url-vector-glyph-flat-icon-172686207.jpg" alt="" class="avatar-sm">
                            </div>

                            <div class="flex-grow-1 overflow-hidden">
                                <h5 class="text-truncate font-size-15">Skote Dashboard UI <?= @$itemDetails[0]->number; ?></h5>
                                <p class="text-muted"><?= @$itemDetails[0]->seal_name; ?></p>
                            </div>
                        </div>

                        <h5 class="font-size-15 mt-4">Item Details :</h5>

                        <p class="text-muted">To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc,</p>

                        <div class="text-muted mt-4">
                            <p>Type
                                <i class="mdi mdi-chevron-right text-primary me-1"></i>
                                <?= @$itemDetails[0]->type; ?>
                            </p>
                            <p>use
                                <i class="mdi mdi-chevron-right text-primary me-1"></i>
                                <?= @$itemDetails[0]->use; ?>
                            </p>
                            <p>client
                                <i class="mdi mdi-chevron-right text-primary me-1"></i>
                                <?= @$itemDetails[0]->client; ?>
                            </p>

                        </div>

                        <div class="row task-dates">
                            <div class="col-sm-4 col-6">
                                <div class="mt-4">
                                    <h5 class="font-size-14"><i class="bx bx-calendar me-1 text-primary"></i> Created Date</h5>
                                    <p class="text-muted mb-0">

                                        <?= date('d-m-Y ', strtotime(@$itemDetails[0]->created_at)) ?>
                                    </p>
                                </div>
                            </div>

                            <div class="col-sm-4 col-6">
                                <div class="mt-4">
                                    <h5 class="font-size-14"><i class="bx bx-calendar-check me-1 text-primary"></i> joining Date</h5>
                                    <p class="text-muted mb-0">
                                        <?= date('d-m-Y ', strtotime(@$itemDetails[0]->doi)) ?>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ItemDetails End -->


    </div> <!-- container-fluid -->
</div>
<!-- End Page-content -->