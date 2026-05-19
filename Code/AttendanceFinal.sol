// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract AttendanceFinalSystem {
    address public teacher;
    uint256 public sessionCount;

    struct Student { string name; bool isRegistered; }
    struct Session { string desc; bool isOpen; uint256 startTime; }
    
    // THÊM: Cấu trúc để lưu thông tin hiển thị
    struct AttendanceInfo {
        string subject;
        string studyDate;
        string status;
    }

    mapping(address => Student) public students;
    mapping(uint256 => Session) public sessions;
    mapping(uint256 => mapping(address => bytes32)) public attendanceProofs;
    
    // THÊM: Mapping mới để lưu thông tin chi tiết
    mapping(uint256 => mapping(address => AttendanceInfo)) public detailedInfo;
    mapping(uint256 => address[]) public sessionAttendees;

    modifier onlyTeacher() {
        require(msg.sender == teacher, "Khong phai Giang vien!");
        _;
    }

    constructor() { teacher = msg.sender; }

    function registerStudent(address _addr, string memory _name) public onlyTeacher {
        students[_addr] = Student(_name, true);
    }

    function createSession(string memory _desc) public onlyTeacher {
        sessionCount++;
        sessions[sessionCount] = Session(_desc, true, block.timestamp);
    }

    // CẬP NHẬT: Thêm tham số đầu vào để lưu 3 thông tin
    function markAttendanceBulk(
        uint256 _sessionId, 
        address[] memory _studentAddrs, 
        bytes32[] memory _dataHashes,
        string memory _subject,
        string memory _studyDate
    ) public onlyTeacher {
        require(sessions[_sessionId].isOpen, "Buoi hoc da dong!");
        for (uint i = 0; i < _studentAddrs.length; i++) {
            address sAddr = _studentAddrs[i];
            if (students[sAddr].isRegistered && attendanceProofs[_sessionId][sAddr] == 0) {
                attendanceProofs[_sessionId][sAddr] = _dataHashes[i];
                
                // LƯU THÔNG TIN CHI TIẾT
                detailedInfo[_sessionId][sAddr] = AttendanceInfo(_subject, _studyDate, "Present");
                
                sessionAttendees[_sessionId].push(sAddr);
            }
        }
    }

    function getSessionAttendees(uint256 _sessionId) public view returns (address[] memory) {
        return sessionAttendees[_sessionId];
    }

    // CẬP NHẬT: Trả về cả mã băm và 3 thông tin cấu trúc
    function verifyAttendance(uint256 _sessionId, address _studentAddr) 
        public 
        view 
        returns (bytes32 hash, string memory subject, string memory studyDate, string memory status) 
    {
        bytes32 h = attendanceProofs[_sessionId][_studentAddr];
        AttendanceInfo memory info = detailedInfo[_sessionId][_studentAddr];
        return (h, info.subject, info.studyDate, info.status);
    }
}