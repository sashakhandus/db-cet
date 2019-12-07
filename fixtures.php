<?php
declare(strict_types=1);

class Fixtures
{
    /**
     * @var PDO $connection
     */
    private static $connection;

    /**
     * @return void
     */
    public function generate(): void
    {
        $connection = $this->getConnection();

        try {
            $connection->beginTransaction();

            $this->cleanup();

            $this->generatePositions ( 16);
            $this->generateEmployes(200);
            $this->generateTransports(65);
            $this->generateSalaries();
            $this->generateIncomes();

            $connection->commit();
        } catch (Exception $e) {
            $connection->rollBack();
            echo $e->getMessage();
        }
    }

    private function getRandomName(): string
    {
        static $randomNames = ['Norbert', 'Damon', 'Laverna', 'Annice', 'Brandie', 'Emogene', 'Cinthia', 'Magaret', 'Daria', 'Ellyn', 'Rhoda', 'Debbra', 'Reid', 'Desire', 'Sueann', 'Shemeka', 'Julian', 'Winona', 'Billie', 'Michaela', 'Loren', 'Zoraida', 'Jacalyn', 'Lovella', 'Bernice', 'Kassie', 'Natalya', 'Whitley', 'Katelin', 'Danica', 'Willow', 'Noah', 'Tamera', 'Veronique', 'Cathrine', 'Jolynn', 'Meridith', 'Moira', 'Vince', 'Fransisca', 'Irvin', 'Catina', 'Jackelyn', 'Laurine', 'Freida', 'Torri', 'Terese', 'Dorothea', 'Landon', 'Emelia'];
        return $randomNames[array_rand($randomNames)];
    }

    private function getRandomTextNumber(): string
    {
        static $randomTextNumber = ['sdfg', 'ytre', 'lkjh', 'iuyt', 'asdf', 'mnbv', 'asdf'];
        return $randomTextNumber[array_rand($randomTextNumber)] ;
    }

    private function getRandomStringParam(): string
    {
        return uniqid();
    }

    /**
     * @return PDO
     */
    public function getConnection(): PDO
    {
        if (null === self::$connection) {
            self::$connection = new PDO('mysql:host=127.0.0.1:3357;dbname=Cet', 'root', 'root', []);
            self::$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
        return self::$connection;
    }

    private function cleanup(): void
    {
        $connection = $this->getConnection();
        $connection->exec('DELETE FROM income WHERE income_id > 38');
        $connection->exec('ALTER TABLE income AUTO_INCREMENT = 39');
        $connection->exec('DELETE FROM salary WHERE salary_id > 44');
        $connection->exec('ALTER TABLE salary AUTO_INCREMENT = 45');
        $connection->exec('DELETE FROM employe WHERE employe_id > 11');
        $connection->exec('ALTER TABLE employe AUTO_INCREMENT = 12');
        $connection->exec('DELETE FROM position WHERE position_id > 10');
        $connection->exec('ALTER TABLE position AUTO_INCREMENT = 11');
        $connection->exec('DELETE FROM transport WHERE transport_id > 8');
        $connection->exec('ALTER TABLE transport AUTO_INCREMENT = 9');
    }

    /**
     * @param int $positionsCount
     * @throws Exception
     */

    public function generatePositions(int $positionsCount): void
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();

        // === CREATE POSITIONS ===
        $start = microtime(true);

        $position = '';
        $statement = $connection->prepare(<<<SQL
INSERT INTO position (position_explanation)
VALUES (:position)
SQL
        );

        $statement->bindParam(':position', $position);

        for ($positionId = 11; $positionId < $positionsCount; $positionId++) {
            $position = 'driver' . $this->getRandomStringParam();
            $statement->execute();
        }

        echo 'Create positions: ' . (microtime(true) - $start) . "\n";
    }

    /**
 * @param int $employesCount
 * @throws Exception
 */

    public function generateEmployes(int $employesCount): void
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();

        // === CREATE EMPLOYES ===
        $start = microtime(true);

        $firstName = $lastName = $gender = $dob = $startOfw = $passport = $employeCode = $positionId = $salaryCurrent = '';
        $minAgeTimestamp = $currentTimestamp - (31556952 * 45);
        $maxAgeTimestamp = $currentTimestamp - (31556952 * 16);
        $statement = $connection->prepare(<<<SQL
INSERT INTO employe (first_name, last_name, gender, dob, start_of_w, passport, employe_code, position_id,  salary_current)
VALUES (:firstName, :lastName, :gender, :dob, :startOfWork, :passport, :employeCode, :positionId, :salaryCurrent)
SQL
        );

        $statement->bindParam(':firstName', $firstName);
        $statement->bindParam(':lastName', $lastName);
        $statement->bindParam(':gender', $gender);
        $statement->bindParam(':dob', $dob);
        $statement->bindParam(':startOfWork', $startOfWork);
        $statement->bindParam(':passport', $passport);
        $statement->bindParam(':employeCode', $employeCode);
        $statement->bindParam(':positionId', $positionId);
        $statement->bindParam(':salaryCurrent', $salaryCurrent);

        for ($employeId = 12; $employeId < $employesCount; $employeId++) {
            $firstName = $this->getRandomName();
            $lastName = $this->getRandomName();
            $gender = random_int(1, 2);
            $timestamp = random_int($minAgeTimestamp, $maxAgeTimestamp);
            $dob = date('Y-m-d', $timestamp);
            $timestampWork = random_int($currentTimestamp - (31556952 * 12), $currentTimestamp);
            $startOfWork = date('Y-m-d', $timestampWork);
            $passport = 'hc' . random_int(100000, 999999);
            $employeCode = random_int(10000000, 99999999);
            $positionId = random_int(1, 15);
            $salaryCurrent = random_int(10000, 30000);
            $statement->execute();
        }

        echo 'Create employes: ' . (microtime(true) - $start) . "\n";
    }

    /**
     * @param int $transportsCount
     * @throws Exception
     */

    public function generateTransports(int $transportsCount): void
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();

        // === CREATE TRANSPORTS ===
        $start = microtime(true);

        $startOfOperation = $numberplate = '';
        $statement = $connection->prepare(<<<SQL
INSERT INTO transport (start_of_op, numberplate)
VALUES (:startOfOperation, :numberplate)
SQL
        );

        $statement->bindParam(':startOfOperation', $startOfOperation);
        $statement->bindParam(':numberplate', $numberplate);

        for ($transportId = 9; $transportId < $transportsCount; $transportId++) {

            $timestampOperation = random_int($currentTimestamp - (31556952 * 12), $currentTimestamp);
            $startOfOperation = date('Y-m-d', $timestampOperation);
            $numberplate = $this->getRandomTextNumber() . random_int(1000, 9999);
            $statement->execute();
        }

        echo 'Create transports: ' . (microtime(true) - $start) . "\n";
    }

    public function generateSalaries(): void
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();

        //========== CREATE SALARIES ===============
        $start = microtime(true);
        $employeId = $salaryDate = $salarySum  = '';
        $statement = $connection->prepare(<<<SQL
    INSERT INTO salary (employe_id, salary_date, salary_sum)
    VALUES (:employeId, :salaryDate, :salarySum)
SQL
        );

        $statement->bindParam(':employeId', $employeId, PDO::PARAM_INT);
        $statement->bindParam(':salaryDate', $salaryDate);
        $statement->bindParam(':salarySum', $salarySum, PDO::PARAM_INT);

        $employeIdsStatement = $connection->query('SELECT employe_id FROM employe');
        $employeIds = $employeIdsStatement->fetchAll(PDO::FETCH_COLUMN);

        foreach ($employeIds as $employeId) {
            for ($i = 1; $i < 13; $i++) {
                $salaryDate = '2019-' . $i . '-' . random_int(1, 10);
                $salarySum = random_int(10000, 30000);
                $statement->execute();
            }
        }

        echo 'Create salaries: ' . (microtime(true) - $start) . "\n";
    }

    public function generateIncomes(): void
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();

        //========== CREATE INCOMES ===============
        $start = microtime(true);
        $employeId = $transportId = $date  =  $earnings = '';
        $statement = $connection->prepare(<<<SQL
    INSERT INTO income (employe_id, transport_id, date, earnings)
    VALUES (:employeId, :transportId, :date, :earnings)
    ON DUPLICATE KEY UPDATE transport_id=VALUES(transport_id);
SQL
        );

        $statement->bindParam(':employeId', $employeId, PDO::PARAM_INT);
        $statement->bindParam(':transportId', $transportId, PDO::PARAM_INT);
        $statement->bindParam(':date', $date);
        $statement->bindParam(':earnings', $earnings, PDO::PARAM_INT);

        $employeIdsStatement = $connection->query('SELECT e.employe_id
FROM employe AS e
         LEFT JOIN position AS p ON e.position_id = p.position_id
WHERE p.position_explanation like \'driver%\';');
        $employeIds = $employeIdsStatement->fetchAll(PDO::FETCH_COLUMN);


        $incomeId = 39;
        foreach ($employeIds as $employeId) {
            for ($k = 1; $k < 10; $k++) {
                for ($j = 1; $j < 13; $j++) {
                    for ($i = 1; $i < 28; $i++) {
                        $date = '201' . $k .'-' . $j . '-' . $i;
                        $earnings = random_int(1000, 3000);
                        $transportId = random_int(1 , 64);
                        $incomeId++;
                        $statement->execute();
                    }
                }
            }
        }

        echo 'Create incomes: ' . (microtime(true) - $start) . "\n";
    }
}

$fixturesGenerator = new Fixtures();
$fixturesGenerator->generate();
