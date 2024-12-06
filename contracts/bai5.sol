// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Nguoi{
    string public Hoten;
    string public  GioiTinh;

    function nhanThongTin(string memory _Hoten, string memory _GioiTinh) public virtual{
       Hoten = _Hoten;
       GioiTinh = _GioiTinh;
    }
    function hienThongTin() public view virtual returns (string memory) {
    return string.concat("Ho ten: ", Hoten, " Gioi tinh: ", GioiTinh);
}
}
contract SinhVien is Nguoi{
    string public TenLop;

    function nhanThongTin(string memory _Hoten, string memory _GioiTinh , string memory _TenLop) public  {
        super.nhanThongTin(_Hoten,_GioiTinh);
        TenLop = _TenLop;
    }
    function hienThongTin() public view virtual override(Nguoi) returns (string memory) {
        return string.concat("Ho ten: ", Hoten, " Gioi tinh: ",GioiTinh," Ten lop:",TenLop);
    }

}
