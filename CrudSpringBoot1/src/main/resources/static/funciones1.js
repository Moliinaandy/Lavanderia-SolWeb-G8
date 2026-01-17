function eliminar(email){
  swal({
    title: "¿Está seguro de eliminar?",
    text: "Una vez eliminado, ¡no podrás recuperar este archivo!",
    icon: "warning",
    buttons: true,
    dangerMode: true,
  })
  .then((OK) => {
    if (OK) {
      $.ajax({
        url: "/eliminar1/" + email,
        type: "GET", // Especificar el tipo de método HTTP (GET o DELETE)
        success: function(res){
          console.log(res); // Aquí puedes manejar la respuesta si es necesario
          swal("¡Poof! Tu archivo imaginario ha sido eliminado.", {
            icon: "success",
          }).then((ok) => {
            if (ok) {
              location.href = "/listar1"; // Redirigir a la lista después de la eliminación
            }
          });
        },
        error: function(xhr, status, error) {
          console.error("Error al eliminar:", error); // Mostrar error en consola
          swal("¡Oops!", "Hubo un error al eliminar el archivo. Intenta de nuevo.", {
            icon: "error",
          });
        }
      });
    } else {
      swal("¡Tu archivo imaginario está a salvo!");
    }
  });
}
