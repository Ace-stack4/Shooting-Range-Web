<?php
// test_connection_DO.php
// Place this file in your project's root directory

// Include database configuration
require_once 'DB_Include_DO/db_config_DO.php';

echo "<h2>Database Connection Test</h2>";

try {
    // Attempt to establish connection
    $conn = getConnection_DO();
    
    if ($conn) {
        echo "<p style='color: green;'>✓ Database connection successful!</p>";
        
        // Test database selection
        echo "<h3>Testing Database Operations:</h3>";
        
        // Test 1: Check if database exists
        $result = $conn->query("SELECT DATABASE()");
        $db_name = $result->fetch_row()[0];
        echo "<p>Current database: " . $db_name . "</p>";
        
        // Test 2: Check tables
        $result = $conn->query("SHOW TABLES");
        echo "<p>Tables in database:</p>";
        echo "<ul>";
        while ($row = $result->fetch_row()) {
            echo "<li>" . $row[0] . "</li>";
        }
        echo "</ul>";
        
        // Test 3: Try a simple query
        $result = $conn->query("SELECT COUNT(*) as count FROM members_DO");
        $count = $result->fetch_assoc()['count'];
        echo "<p>Number of members in database: " . $count . "</p>";
        
        // Close connection
        closeConnection_DO($conn);
        echo "<p style='color: green;'>✓ Connection closed successfully!</p>";
    }
} catch (Exception $e) {
    echo "<p style='color: red;'>✗ Connection failed: " . $e->getMessage() . "</p>";
    echo "<h3>Troubleshooting Steps:</h3>";
    echo "<ol>";
    echo "<li>Check if XAMPP/MySQL is running</li>";
    echo "<li>Verify database name is correct (L11_Okpachui_56037_mid2_DO)</li>";
    echo "<li>Confirm username and password in db_config_DO.php</li>";
    echo "<li>Ensure all tables are created properly</li>";
    echo "</ol>";
}
?>