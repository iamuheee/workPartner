<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        

        /* 전자결재 기안서 목록 모달 */
        #modal {
            z-index: 1050;
        }

        #modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(95, 95, 95, 0.666);
            box-shadow: 0 8px 32px 0 rgba(61, 61, 61, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }

        #modal .modal-window {
            background: rgba(255, 255, 255);
            box-shadow: 0 8px 32px 0 rgba(34, 34, 34, 0.37);
            backdrop-filter: blur(13.5px);
            -webkit-backdrop-filter: blur(13.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
            width: 300px;
            height: 200px;
            position: relative;
            top: -100px;

        }

        #modal .modaltitle {
            display: inline-block;
            color: rgb(7, 7, 7);
            border-bottom: 1px solid #8787874d;
            padding-bottom: 10px;
            margin-top: 15px;

            width: 100%;
        }

        #modal .modaltitle h4 {
            display: inline;
            padding: 20px;

        }

        #modal .modalcontent {
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: rgb(0, 0, 0);
        }

        #modal .modaltitle>hr {
            margin-top: 15px;
            margin-bottom: 0;
            padding: 0;
        }

        .material-symbols-outlined {
            font-variation-settings:
                'FILL' 0,
                'wght' 600,
                'GRAD' 0,
                'opsz' 48;
            float: right;
            color: rgb(143, 143, 143);
            margin-right: 20px;
        }

        .close-area:hover {
            cursor: pointer;
            color: rgb(100, 100, 100);
            font-weight: 600;
        }

        .searchEmp {
            display: flex;
            width: 240px;
            height: 500px;
            border-right: 1px solid #8787874d;
            margin-top: 0;
        }

        .material-symbols-outlined {
            font-variation-settings:
                'FILL' 0,
                'wght' 400,
                'GRAD' 0,
                'opsz' 48
        }

        .modalSearch {
            position: relative;
            height: 30px;
            width: 200px;
            margin: 15px;
        }

        .searchBtn {
            position: absolute;
            left: 180px;
            top: 74px;
            background-color: white;
            border: none;
        }

        .searchBtn:hover {
            cursor: pointer;
            color: black;
        }

        .dPaperBtn>button {
            display: inline-block;
            width: 140px;
            height: 50px;
            margin-top: 10px;
            border: 1px solid #8787874d;
        }
    </style>


    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <script src="https://uicdn.toast.com/tui-tree/latest/tui-tree.js"></script>
    <link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-tree/latest/tui-tree.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <!-- 기안서 작성 팝업 -->
    <script>
       
       function showPopup(){
        
        vacation = window.open("vaEnroll.si", "btn", "width=805, height=800");
        vacation.moveTo(560,120);
        vacation.focus();
        };
    </script>
    <script>
       
       function showPopup2(){
        
        vacation = window.open("owEnroll.si", "btn", "width=805, height=800");
        vacation.moveTo(560,120);
        vacation.focus();
        };
    </script>
    <script>
       
        function showPopup3() {

        	 vacation = window.open("reEnroll.si", "btn", "width=805, height=800");
             vacation.moveTo(560,120);
             vacation.focus();

            }
    </script>
    <script>
       
        function showPopup4() {
        	 vacation = window.open("coEnroll.si", "btn", "width=805, height=800");
             vacation.moveTo(560,120);
             vacation.focus();
            }
    </script>
   
</head>
<body>
	 <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="modaltitle">
                <h4>서식 목록</h4>
                <span class="material-symbols-outlined close-area">
                    close
                </span>
            </div>
            <div class="dPaperBtn" align="center">
                <button class="vacation" onclick="showPopup();" name="vacation">연차 신청서</button>
                <button class="outWork" onclick="showPopup2();" name="outWork">외근 신청서</button>
                <button class="reSignEmp" onclick="showPopup3();" name="reSign">퇴직원 신청서</button>
                <button class="cooperation" onclick="showPopup4();" name="coop">업무협조 신청서</button>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            const modal = document.getElementById("modal")
            const btnModal = document.getElementById("btn-modal")
            btnModal.addEventListener("click", e => {
                modal.style.display = "flex"
            })
            const closeBtn = modal.querySelector(".close-area")
            closeBtn.addEventListener("click", e => {
                modal.style.display = "none"
            })
            window.addEventListener("keyup", e => {
                if (modal.style.display === "flex" && e.key === "Escape") {
                    modal.style.display = "none"
                }
            })
            modal.addEventListener("click", e => {
                const evTarget = e.target
                if (evTarget.classList.contains("modal-overlay")) {
                    modal.style.display = "none"
                }
            })
            modal.addEventListener("click", v => {
                const vaTarget = v.target
                if (vaTarget.classList.contains("vacation")) {
                    modal.style.display = "none"
                }
            })
            modal.addEventListener("click", o => {
                const outTarget = o.target
                if (outTarget.classList.contains("outWork")) {
                    modal.style.display = "none"
                }
            })
            modal.addEventListener("click", r => {
                const reSignEmpTarget = r.target
                if (reSignEmpTarget.classList.contains("reSignEmp")) {
                    modal.style.display = "none"
                }
            })
            modal.addEventListener("click", c => {
                const coopTarget = c.target
                if (coopTarget.classList.contains("cooperation")) {
                    modal.style.display = "none"
                }
            })
        })
    </script>
</body>
</html>