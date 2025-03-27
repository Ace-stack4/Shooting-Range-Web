<?php
// db_config_DO.php - Database configuration file

// Database credentials
define('DB_HOST_DO', 'localhost');
define('DB_USER_DO', 'root');
define('DB_PASS_DO', '');
define('DB_NAME_DO', 'L11_Okpachui_56037_mid2_DO');

// Create connection
function getConnection_DO() {
    try {
        $conn = new mysqli(DB_HOST_DO, DB_USER_DO, DB_PASS_DO, DB_NAME_DO);
        
        // Check connection
        if ($conn->connect_error) {
            throw new Exception("Connection failed: " . $conn->connect_error);
        }
        
        // Set charset to ensure proper handling of special characters
        $conn->set_charset("utf8mb4");
        
        return $conn;
    } catch (Exception $e) {
        // Log error and display user-friendly message
        error_log("Database Connection Error: " . $e->getMessage());
        die("Sorry, we're experiencing technical difficulties. Please try again later.");
    }
}

// Close connection
function closeConnection_DO($conn) {
    if ($conn instanceof mysqli) {
        $conn->close();
    }
}

// Sanitize input
function sanitizeInput_DO($conn, $input) {
    if (is_array($input)) {
        return array_map(function($item) use ($conn) {
            return $conn->real_escape_string(trim($item));
        }, $input);
    }
    return $conn->real_escape_string(trim($input));
}

// Execute query with error handling
function executeQuery_DO($conn, $sql) {
    try {
        $result = $conn->query($sql);
        if ($result === false) {
            throw new Exception("Query failed: " . $conn->error);
        }
        return $result;
    } catch (Exception $e) {
        error_log("Database Query Error: " . $e->getMessage());
        return false;
    }
}