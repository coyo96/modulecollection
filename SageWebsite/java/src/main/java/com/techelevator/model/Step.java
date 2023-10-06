package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class Step {
    @JsonIgnore
    private int step_id;

    private int rank;

    private String instruction;

    public Step() { }

    public Step(int step_id, int rank, String instruction) {
        this.step_id = step_id;
        this.rank = rank;
        this.instruction = instruction;
    }

    public int getStep_id() {
        return step_id;
    }

    public void setStep_id(int step_id) {
        this.step_id = step_id;
    }

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }
}
