<style>
    .w50 {
        width: 39px;
        margin-bottom: 10px;
    }

    .fright {
        float: right;
    }

    .fleft {
        float: left;
    }
</style>
<div class="page-content">
    <div class="container-fluid">

        <!-- start page title -->
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                    <h4 class="mb-sm-0 font-size-18">customer List</h4>

                    <div class="page-title-right">
                        <ol class="breadcrumb m-0">
                            <li class="breadcrumb-item"><a href="javascript: void(0);">Customer </a></li>
                            <li class="breadcrumb-item active">customer List</li>
                        </ol>
                    </div>

                </div>
            </div>
        </div>
        <!-- end page title -->

        <!-- Item Table Start -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">

                        <h4 class="card-title"> <?= @$itemList[0]->item_name; ?></h4>
                        <p class="card-title-desc">

                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                        </p>
                        <p class="card-title-desc">
                            <?= @$itemList[0]->item_description; ?>
                        </p>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <a data-toggle="modal" data-target="#exampleModal">
                                                <img src="/public/admin/dist/img/xls.png" title="Excel Export" class="w50" alt="excel export">
                                            </a>

                                        </div>
                                        <div class="col-lg-6" style="text-align: right;">
                                            <form id="excelFormOLD" class="fright" action="/home/report_export" method="post">


                                                <a id="excelExport">
                                                    <img src="/public/admin/dist/img/xls.png" title="Excel Export" class="w50" alt="excel export">
                                                </a>

                                            </form>
                                        </div>
                                    </div>
                                    <div class="table-responsive">
                                        <table id="datatable" class="table project-list-table table-nowrap align-middle table-borderless">
                                            <thead>
                                                <tr>
                                                    <th scope="col" style="width: 100px">#</th>
                                                    <th scope="col">Item number</th>
                                                    <th scope="col">Item seal name</th>
                                                    <th scope="col">doi</th>
                                                    <th scope="col">type</th>
                                                    <th scope="col">client</th>
                                                    <th scope="col">Created Date</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Created By</th>
                                                    <!-- <th scope="col">Action</th> -->
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <?php foreach ($itemList as $key => $value) { ?>
                                                    <tr>
                                                        <td><?= $key + 1; ?> </td>
                                                        <td>
                                                            <h5 class="text-truncate font-size-14">
                                                                <a href="/admin/item-details/<?= $value->id; ?>" class="text-dark">
                                                                    <?= $value->number; ?>
                                                                </a>
                                                            </h5>

                                                        </td>
                                                        <td>
                                                            <?= ($value->seal_name) ?>
                                                        </td>
                                                        <td>
                                                            <?= date('d-m-Y', strtotime($value->doi)) ?>

                                                        </td>

                                                        <td>
                                                            <?= ($value->type) ?>
                                                        </td>
                                                        <td>
                                                            <?= ($value->client) ?>
                                                        </td>

                                                        <td>
                                                            <?= date('jS F, y ', strtotime($value->created_at)) ?>
                                                        </td>

                                                        <td>
                                                            <?php if ($value->isactive) { ?>
                                                                <span class="badge bg-success">Active</span>
                                                            <?php } else { ?>
                                                                <span class="badge bg-danger">In Active</span>
                                                            <?php } ?>
                                                        </td>

                                                        <td>
                                                            <div class="avatar-group">
                                                                <?php if (@$value->profile_pic) { ?>
                                                                    <div class="avatar-group-item">
                                                                        <a href="javascript: void(0);" class="d-inline-block" title="<?= @$value->first_name; ?>">
                                                                            <img src="<?= $value->profile_pic; ?>" alt="" class="rounded-circle avatar-xs">
                                                                        </a>
                                                                    </div>
                                                                <?php } else { ?>


                                                                    <?php if (@$value->first_name) { ?>

                                                                        <div class="avatar-group-item">
                                                                            <a href="javascript: void(0);" class="d-inline-block" title="<?= @$value->first_name; ?>">
                                                                                <div class="avatar-xs">
                                                                                    <span class="avatar-title rounded-circle bg-success text-white font-size-16 custome-uppercase">
                                                                                        <?= $value->first_name[0]; ?>
                                                                                    </span>
                                                                                </div>
                                                                            </a>
                                                                        </div>
                                                                    <?php } else { ?>
                                                                        <div class="avatar-group-item">
                                                                            <a href="javascript: void(0);" class="d-inline-block">
                                                                                <img src="/public/layouts/assets/images/users/default.png" alt="" class="rounded-circle avatar-xs" title="No Information Present">
                                                                            </a>
                                                                        </div>
                                                                    <?php } ?>


                                                                <?php } ?>

                                                            </div>
                                                        </td>


                                                    </tr>
                                                <?php } ?>





                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Item Table End -->

    </div> <!-- container-fluid -->
</div>
<!-- End Page-content -->

<script>
    $("#excelExport").on("click", function() {
        location.href = "/admin/home/excel_export" + window.location.search;
    });
    $("#excelImportModal").on("click", function() {
        $("#uploadModal").modal();
    });
</script>

<!-- img Modal -->
<div class="modal fade" id="exampleModal" role="dialog">
    <div class="modal-dialog">
        <!-- img Modal content-->
        <form action="" method="post" id="excelForm">
            <input type="hidden" name="column_name_upload_from" id="column_name_upload_from">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"> Document Upload </h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group wc100">
                            <label class="col-md-12 pd-lf"> <span id="doc_lable"></span> Document Upload </label>
                            <input type="file" name="documentFile" id="documentFile">

                        </div>
                        <label id="documentFile_Error" class="myError" style="display: none;"> </label>
                        <label id="exam_file_Error" class="myError" style="display: none;"> </label>
                    </div>

                </div>
                <div class="modal-footer">
                    <a class="btn aprove format-xl" style="margin-top: -10px;" href="/public/files/sampleDocument.xls" download="">
                        Download Excel Format
                        <i class="fa fa-download" style="margin: 3px; color: #12a983;"></i>
                    </a>
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="button" class="btn cancel-btn" data-dismiss="modal">Close</button>
                </div>
            </div>
        </form>

    </div>
</div>
<!---end img modal----->


<script>
    // for file

    $("#excelForm").validate({
        ignore: ".ignore",
        rules: {
            documentFile: {
                required: true,
            },
        },
        messages: {
            documentFile: "Please provide File",

        },
        invalidHandler: function(f, v) {
            // validateAll("bankBreadCrums");
        },
        errorElement: "div",
        errorPlacement: function(error, element) {
            var placement = $(element).data("error");
            if (placement) {
                $(placement).append(error);
            } else {
                error.insertAfter(element);
            }
        },
        submitHandler: function(form) {
            var exam_file = document.querySelector("input[name='documentFile']")
                .files[0];
            console.log(exam_file);

            var data = new FormData();
            data.append("exam_file", exam_file);

            $.ajax({
                type: "POST",
                url: "/admin/home/excel_import",
                async: false,
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                success: function(data) {
                    exportExcel(data["data"].split("<br/>"));

                    Swal.fire({
                        title: data["message"],
                        icon: "warning",
                        text: "File added successfully",
                        closeOnClickOutside: false,
                        closeOnEsc: false,
                    });

                },
                error: function(data) {

                    Swal.fire({
                        title: "Alert",
                        icon: "warning",
                        text: data.responseJSON["message"],
                        closeOnClickOutside: false,
                        closeOnEsc: false,
                    });

                },
            });
        },
    });

    function exportExcel(Results) {
        var CsvString = "";

        Results.forEach(function(ColItem, ColIndex) {
            CsvString += ColItem + ",";
            CsvString += "\r\n";
        });

        window.open("data:application/vnd.ms-excel," + encodeURIComponent(CsvString));
    }
</script>