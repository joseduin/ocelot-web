$(document).ready(function(){
    toastr.options = {
	  closeButton: true,
	  debug: false,
	  newestOnTop: true,
	  progressBar: true,
	  positionClass: "toast-top-right",
	  preventDuplicates: true,
	  showDuration: 300,
	  hideDuration: 1000,
	  timeOut: 5000,
	  extendedTimeOut: 1000,
	  showEasing: "swing",
	  hideEasing: "linear",
	  showMethod: "fadeIn",
	  hideMethod: "fadeOut"
	}
});


function msjTipo(msj, tipo, ubicacion) {
    toastrMsj();
    switch (ubicacion) {
        case 'izq':
            toastr.options.positionClass = 'toast-top-left';
            break;
        case 'der':
            toastr.options.positionClass = 'toast-top-right';
            break;
        case 'cent':
            toastr.options.positionClass = 'toast-top-center';
            break;
        case 'abajo':
            toastr.options.positionClass = 'toast-bottom-full-width';
            break;
    }
    switch (tipo) {
        case 'error':
            toastr.error(msj);
            break;
        case 'alert':
            toastr.warning(msj);
            break;
        case 'mensaje':
            toastr.success(msj);
            break;
    }
}

function toastrMsj() {
    toastr.options = {
        closeButton: true,
        progressBar: true,
        timeOut: 4000,
        showEasing: 'swing',
        hideEasing: 'swing',
        showMethod: 'slideDown',
        hideMethod: 'slideUp'
    };

    toastr.clear();
}