<?php
// see_members_DO.php
require_once '../DB_Include_DO/db_config_DO.php';
include '../Main_Include_DO/header_DO.php';

$conn = getConnection_DO();

$sql = "SELECT 
    m.member_id_DO,
    m.first_name_DO,
    m.last_name_DO,
    m.license_number_DO,
    m.join_date_DO,
    COUNT(mt.program_id_DO) as training_count_DO,
    COUNT(cr.competition_id_DO) as competition_count_DO
FROM members_DO m
LEFT JOIN member_training_DO mt ON m.member_id_DO = mt.member_id_DO
LEFT JOIN competition_results_DO cr ON m.member_id_DO = cr.member_id_DO
GROUP BY m.member_id_DO";

$result = $conn->query($sql);
?>

<div class="container-DO">
    <h2>Members List</h2>
    
    <div class="table-container-DO">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>License Number</th>
                    <th>Join Date</th>
                    <th>Trainings</th>
                    <th>Competitions</th>
                </tr>
            </thead>
            <tbody>
                <?php while($row = $result->fetch_assoc()): ?>
                <tr>
                    <td><?php echo $row['member_id_DO']; ?></td>
                    <td><?php echo $row['first_name_DO']; ?></td>
                    <td><?php echo $row['last_name_DO']; ?></td>
                    <td><?php echo $row['license_number_DO']; ?></td>
                    <td><?php echo $row['join_date_DO']; ?></td>
                    <td><?php echo $row['training_count_DO']; ?></td>
                    <td><?php echo $row['competition_count_DO']; ?></td>
                </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    </div>
</div>

<?php
closeConnection_DO($conn);
include '../Main_Include_DO/footer_DO.php';
?>