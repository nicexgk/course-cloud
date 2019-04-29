package com.example.course.pojo;

public class Message {
        private int ope;
        private int page;
        private int size;
        private String msg;

        public int getOpe() {
            return ope;
        }

        public void setOpe(int ope) {
            this.ope = ope;
        }

        public int getPage() {
            return page;
        }

        public void setPage(int page) {
            this.page = page;
        }

        public int getSize() {
            return size;
        }

        public void setSize(int size) {
            this.size = size;
        }

        public String getMsg() {
            return msg;
        }

        public void setMsg(String msg) {
            this.msg = msg;
        }

        @Override
        public String toString() {
            return "Message{" +
                    "ope=" + ope +
                    ", page=" + page +
                    ", size=" + size +
                    ", msg='" + msg + '\'' +
                    '}';
        }
    }