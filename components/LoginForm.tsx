import { useForm, SubmitHandler } from "react-hook-form";

type Inputs = {
  example: string,
  exampleRequired: string,
};

interface LoginData {
  email: string;
  password: string;
}
const LoginForm: React.FC = () => {
  const { register, handleSubmit, formState: { errors } } = useForm<LoginData>();
  const onSubmit: SubmitHandler<LoginData> = data => console.log(data);

  return (
    /* "handleSubmit" will validate your inputs before invoking "onSubmit" */
    <form onSubmit={handleSubmit(onSubmit)}>
      {/* register your input into the hook by invoking the "register" function */}
      <input defaultValue="test" {...register("example")} />

      {/* include validation with required or other standard HTML validation rules */}
      <input {...register("exampleRequired", { required: true })} />
      {/* errors will return when field validation fails  */}
      {errors.exampleRequired && <span>This field is required</span>}

      <button
        type="submit"
        className="w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700 transition duration-150 ease-in-out"
      >
        Sign up
      </button>    </form>
  );
};
export default LoginForm;
