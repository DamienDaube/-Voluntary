import flatpickr from "flatpickr"
import "flatpickr/dist/themes/dark.css" // Note this is important!

flatpickr(".datepicker", {
    enableTime: true,
    altInput: true,
    altFormat: "H:i, F j, Y",
    dateFormat: "Y-m-d H:i",
})
