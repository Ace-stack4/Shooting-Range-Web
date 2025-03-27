<?php
function validateEmployeeData($data) {
    $errors = [];
    
    if (empty($data['first_name'])) {
        $errors[] = "First name is required";
    }
    if (empty($data['last_name'])) {
        $errors[] = "Last name is required";
    }
    if (empty($data['email'])) {
        $errors[] = "Email is required";
    }
    if (empty($data['type_id'])) {
        $errors[] = "Employee type is required";
    }
    
    return $errors;
}
?> 