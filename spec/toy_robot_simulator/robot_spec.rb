require 'spec_helper'
require 'toy_robot_simulator/robot'

module ToyRobotSimulator
  describe Robot do
    let(:robot) { Robot.new }

    describe '#place and #report' do
      it 'should place robot to specific position' do
        robot.place(0, 0, 'NORTH')

        expect { robot.report }.to output(/0,0,NORTH/).to_stdout
      end

      it 'should not place robot when not on table' do
        allow_any_instance_of(Position).to receive(:on_table).and_return false

        expect(robot.place(-1, 0, 'NORTH')).to eq(false)
        expect(robot.errors).not_to be_empty
      end

      it 'should append the report command error when robot is not on table' do
        expect(robot.report).to eq(false)
        expect(robot.errors).to include('Robot is not on table.')
      end
    end

    describe '#move' do
      it 'should move forward north' do
        robot.place(0, 0, 'NORTH')
        robot.move

        expect { robot.report }.to output(/0,1,NORTH/).to_stdout
      end

      it 'should move forward west' do
        robot.place(1, 0, 'WEST')
        robot.move

        expect { robot.report }.to output(/0,0,WEST/).to_stdout
      end

      it 'should move forward east' do
        robot.place(0, 0, 'EAST')
        robot.move

        expect { robot.report }.to output(/1,0,EAST/).to_stdout
      end

      it 'should move forward south' do
        robot.place(0, 1, 'SOUTH')
        robot.move

        expect { robot.report }.to output(/0,0,SOUTH/).to_stdout
      end

      it 'should append the move command error when robot is not on table' do
        expect(robot.move).to eq(false)
        expect(robot.errors).to include('Robot is not on table.')
      end

      it 'should append the move command error when next position is invalid' do
        robot.place(0, 0, 'SOUTH')
        robot.move

        expect(robot.errors).not_to be_empty
        expect { robot.report }.to output(/0,0,SOUTH/).to_stdout
      end
    end

    describe '#left' do
      it 'should turn to west when facing north' do
        robot.place(0, 0, 'NORTH')
        robot.left

        expect { robot.report }.to output(/0,0,WEST/).to_stdout
      end

      it 'should turn to south when facing west' do
        robot.place(0, 0, 'WEST')
        robot.left

        expect { robot.report }.to output(/0,0,SOUTH/).to_stdout
      end

      it 'should turn to east when facing south' do
        robot.place(0, 0, 'SOUTH')
        robot.left

        expect { robot.report }.to output(/0,0,EAST/).to_stdout
      end

      it 'should turn to north when facing east' do
        robot.place(0, 0, 'EAST')
        robot.left

        expect { robot.report }.to output(/0,0,NORTH/).to_stdout
      end

      it 'should append the left command error when robot is not on table' do
        expect(robot.left).to eq(false)
        expect(robot.errors).to include('Robot is not on table.')
      end
    end

    describe '#right' do
      it 'should turn to east when facing north' do
        robot.place(0, 0, 'NORTH')
        robot.right

        expect { robot.report }.to output(/0,0,EAST/).to_stdout
      end

      it 'should turn to south when facing east' do
        robot.place(0, 0, 'EAST')
        robot.right

        expect { robot.report }.to output(/0,0,SOUTH/).to_stdout
      end

      it 'should turn to west when facing south' do
        robot.place(0, 0, 'SOUTH')
        robot.right

        expect { robot.report }.to output(/0,0,WEST/).to_stdout
      end

      it 'should turn to north when facing west' do
        robot.place(0, 0, 'WEST')
        robot.right

        expect { robot.report }.to output(/0,0,NORTH/).to_stdout
      end

      it 'should append the right command error when robot is not on table' do
        expect(robot.right).to eq(false)
        expect(robot.errors).to include('Robot is not on table.')
      end
    end
  end
end
